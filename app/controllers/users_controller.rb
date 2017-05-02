class UsersController < ApplicationController
    # GET /admins/1/edit
    def edit
      is_logged
      @user = User.find(params[:id])
    end

    # PATCH/PUT /admins/1
    # PATCH/PUT /admins/1.json
    def update
      is_logged
      respond_to do |format|

        if user_params[:encrypted_code] == user_params[:encrypted_code2]
          params_user = params.require(:user).permit(:encrypted_code)
          params_user[:encrypted_code] = Digest::SHA1.hexdigest(params_user[:encrypted_code])

          @user = User.find(params[:id])
          if @user.update(params_user)
            format.html { redirect_to root_path, notice: 'Votre Code Confidentiel a été correctement modifié' }
            format.json { render :index, status: :ok, location: root_path }
          else
            format.html { render :edit }
            format.json { render json: @admin.errors, status: :unprocessable_entity }
          end
        else
          format.html { redirect_to root_path, notice: 'Les deux Codes Confidentiels sont différents' }
          format.json { render :index, status: :ok, location: root_path}
        end
      end
    end


  private
  def user_params
    params.require(:user).permit(:encrypted_code, :encrypted_code2)
  end


end
