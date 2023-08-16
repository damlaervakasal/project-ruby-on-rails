class UsersController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          session[:user_id] = @user.id
          format.html { redirect_to root_path, notice: 'User was successfully created.' }
        else
          flash.now[:alert] = "Invalid email or password."
          format.html { render :new }
        end
      end
    end

    def search
    end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

