class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @published_cards = Card.where(status: :published)
    @archived_card = Card.where(status: :archived)
    @todo_card = Card.where(category: :todo)
    @underway_card = Card.where(category: :underway)
    @done_card = Card.where(category: :done)
    @user = current_user
  end

  def show
    @card = Card.find(params[:id])
    
  end

  def new 
    @card = Card.new
    @current_user = User.find_by(email: params[:user_email])
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id
    puts '================================'
    puts @card.inspect
    if @card.save
      @card.user_ids = params[:card][:user_ids]
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
      if @card.update(card_params)
        redirect_to @card
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @card.destroy
  
    redirect_to root_path, status: :see_other
  end
    
  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :body, :status, :category, user_ids: [])
  end

  def authorize_user
    if @card.user != current_user
      redirect_to root_path, notice: 'BU işlem için yetkiniz yok!'
    end
  end
end
