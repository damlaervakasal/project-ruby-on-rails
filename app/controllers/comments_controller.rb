class CommentsController < ApplicationController
    def create
        @card = Card.find(params[:card_id])
        @comment = @card.comments.build(comment_params)
        if @comment.save
            redirect_to card_path(@card)
        end

    end

    def destroy
        @card = Card.find(params[:card_id])
        @comment = @card.comments.find(params[:id])
        @comment.destroy
        redirect_to card_path(@card)
    end
    
    private

    def comment_params
        params.require(:comment).permit(:commenter, :body, :card_id)
    end
    
end