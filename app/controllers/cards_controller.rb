class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new 
    @card = Card.new
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
    params.require(:card).permit(:title, :body, :status)
  end
end
