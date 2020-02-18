class FavouritesController < ApplicationController
    
    def create
        favourite = Favourite.create(favourite_params)
        render json: favourite
    end

    private

    def favourite_params
        params.require(:favourite).permit(:user_id, :story_id)
    end

end
