class UsersController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save && @user.password_match?
      redirect_to root_url, notice:"Başarılı bir şekilde kaydınız oluşturuldu. Lüfen giriş yapın."
      elsif !@user.password_match?
        redirect_to signup_path, notice:'Şifreler eşleşmiyor veya formu eksiksiz doldurmadınız.'
      else
        redirect_to signup_path, notice:'formu eksiksiz doldurmadınız.'
      end    

      assignment_ids = params[:assignment_ids]
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

