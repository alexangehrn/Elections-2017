class SessionsController < ApplicationController
  def new
  end

  def create
    @password = Digest::SHA1.hexdigest(params[:encrypted_code])

    user = User.authenticate(params[:name], @password)
    if user
      if !user.active
        user.active = 1
        user.save
        session[:user_id] = user.id
        redirect_to edit_user_path(user), :notice =>'Vous êtes correctement connecté'
      else
        session[:user_id] = user.id
        redirect_to candidates_path, :notice =>'Vous êtes correctement connecté'
      end
    else
      flash.now.alert = "Nom ou code confidentiel Invalide"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to candidates_path, :notice => "Vous êtes correctement déconnecté"
  end



end
