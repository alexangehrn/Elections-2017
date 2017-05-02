class Admin::UsersController < ApplicationController

  def index
    is_admin_logged
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    is_admin_logged
    @user = User.find(params[:id])
  end

  def new
    is_admin_logged
    @user = User.new
  end

  def create
    is_admin_logged
    v = params.require(:user).permit(:file)

    if(params[:file].present?)
      csv_import(v[:file].path)
      redirect_to action: "index", :notice => @user.active

    else
      @user = User.new(user_params)
      @user.tour1 = 0
      @user.tour2 = 0
      @user.active = 0
      @user.encrypted_code = Digest::SHA1.hexdigest(user_params[:encrypted_code])

      if @user.save
        redirect_to action: "index", :notice => @user.active
      else
        render "new"
      end
    end
  end


  def csv_import(file)
    require 'csv'

    CSV.foreach(file) do |row|
      @user = User.new()
      @user.name = row[0]
      @user.forname = row[1]
      @user.encrypted_code = Digest::SHA1.hexdigest(row[2])
      @user.postal = row[3]
      @user.bureau = row[4]
      @user.tour1 = 0
      @user.tour2 = 0
      @user.active = 0
      @user.save
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :forname, :encrypted_code, :postal, :bureau, :tour1, :tour2, :active)
  end


end
