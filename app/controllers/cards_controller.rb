class CardsController < ApplicationController
  def index
    @published_cards = Card.where(status: :published)
    @archived_card = Card.where(status: :archived)
    @todo_card = Card.where(category: :todo)
    @underway_card = Card.where(category: :underway)
    @done_card = Card.where(category: :done)
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
    puts '================================'
    puts @card.inspect
    if @card.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
      @card = Card.find(params[:id])

      if @card.update(card_params)
        redirect_to @card
      else
        render :edit, status: :unprocessable_entity
      end
    end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
  
    redirect_to root_path, status: :see_other
    end
  
    
  private
  def card_params
    params.require(:card).permit(:title, :body, :status, :category)
  end
end
