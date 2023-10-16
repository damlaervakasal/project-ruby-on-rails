class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :destroy, :show]
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
  end

  def new
    redirect_to login_path, notice: "Giriş yapmalısınız" unless current_user.present?
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id

    
    if @card.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [turbo_stream.prepend(@card.category, 
                                                     partial: 'cards/card', 
                                                     locals: { card: @card }),
                                turbo_stream.update('popup')]
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit  
  end 

  def update
      if @card.update(card_params)
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: [turbo_stream.replace(@card,
                                                        partial: 'cards/card', 
                                                        locals: { card: @card }),
                                  turbo_stream.update('popup')]
          end
        end
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    if @card.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(@card)
      end
    end
    else
      render :new, status: :unprocessable_entity
    end
  end
    
  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :body, :status, :category, user_ids: [], card_ids: [])
  end

  def authorize_user
    if @card.user != current_user
      redirect_to card_path, notice: "Yetkiniz yok"
    end
  end



end
