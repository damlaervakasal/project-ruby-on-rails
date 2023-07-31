class CommentsController < ApplicationController
    before_action :set_card

    def new
        @comment = Comment.new
    end

    def create
        @comment = @card.comments.build(comment_params)
        if @comment.save
            redirect_to card_path(@card)
        else
            render :new, status: :unprocessable_entity
        end

    end

    def destroy
        @comment = @card.comments.find(params[:id])
        @comment.destroy
        redirect_to card_path(@card)
    end
    
    private
    def comment_params
        params.require(:comment).permit( :body, :card_id)
    end

    def set_card
        @card = Card.find(params[:card_id])
    end


    
end