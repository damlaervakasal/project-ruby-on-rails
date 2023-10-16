class SearchesController < ApplicationController
    def index
        @searches = User.all
    end

    def show
        @searches = User.where("name LIKE ?", "%#{params[:search]}%")
        results = []

        @searches.all.each do |name|
          results << name
        end
      
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.update('searched_user', partial: "results",  locals: { results: results })
          end
        end
    end

end



