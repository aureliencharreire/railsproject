class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit]

    def index
        @users = User.all
    end

    def edit_user
        @user = User.find_by_id(params[:id])
    end

    def update_user
        @user = User.find_by_id(params[:id])
        respond_to do |format|
            if @user.update(account_update_params)
                format.html { redirect_to users_path, notice: 'User was successfully updated.' }
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :edit }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    protected

    def set_user
      @user = User.find(params[:id])
    end

    def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :city, :post_code, :adress, :phone, :admin)
    end

    def account_update_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :city, :post_code, :adress, :phone ,:admin)
    end

end
