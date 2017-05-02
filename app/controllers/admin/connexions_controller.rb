class Admin::ConnexionsController < ApplicationController
  def index
    @current_admin_statut = current_admin.statut
    is_admin_logged
  end

  def new
  end

  def create
    @password = Digest::SHA1.hexdigest(params[:password])
    admin = Admin.authenticate(params[:login], @password)
    if admin
      session[:admin_id] = admin.id
      redirect_to admin_connexions_path action:"index", :notice =>'Vous avez été correctement connecté'
    else
      flash.now.alert = "Login ou Mot de Passe invalide"
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to action: "new", :notice => "Vous avez été correctement déconnecté"
  end
end
