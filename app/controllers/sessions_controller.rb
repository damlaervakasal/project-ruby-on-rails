class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]
  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash.now[:alert] = "Incorrect email or password."
        redirect_to root_path
      else
        flash.now[:alert] = "Incorrect email or password."
        render :new, status: :unprocessable_entity
      end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Signed out."
  end
end
