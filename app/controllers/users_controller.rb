class UsersController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
      redirect_to root_path, notice:"Başarılı bir şekilde kaydınız oluşturuldu. Lüfen giriş yapın."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

