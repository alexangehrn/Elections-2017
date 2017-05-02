class Admin::AdminsController < ApplicationController
  require 'digest/sha1'

  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    is_admin_logged
    is_admin_super_admin
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    is_admin_logged
    is_admin_super_admin
  end

  # GET /admins/new
  def new
    is_admin_logged
    is_admin_super_admin
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
    is_admin_super_admin
    is_admin_logged
  end

  # POST /admins
  # POST /admins.json
  def create
    is_admin_logged
    is_admin_super_admin
    @admin = Admin.new(admin_params)
    @admin.password = Digest::SHA1.hexdigest(admin_params[:password])
    respond_to do |format|
      if @admin.save
        format.html { redirect_to admin_admins_path, notice: 'L\'administrateur a été correctement créé' }
        format.json { render :show, status: :created, location: admin_admin_path }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    is_admin_logged
    is_admin_super_admin
    respond_to do |format|
      update_params = params.require(:admin).permit(:login, :password, :statut)
      update_params[:password] = Digest::SHA1.hexdigest(update_params[:password])

      if @admin.update(update_params)
        format.html { redirect_to admin_admins_path, notice: 'L\'administrateur a été correctement modifié' }
        format.json { render :show, status: :ok, location: admin_admin_path }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    is_admin_logged
    is_admin_super_admin
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_admins_path, notice: 'L\'administrateur a été correctement supprimé' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.require(:admin).permit(:login, :password, :statut)
  end





end
