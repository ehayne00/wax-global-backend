class StoriesController < ApplicationController

    def index
        stories = Story.all 
        render json: stories
    end

    def create
        story = Story.create(story_params)
        render json: story 
    end

    def show
        story = Story.find(params[:id])
        render json: story
    end

    def update
        story = Story.find(params[:id])
        story.update(story_params)
        render json: story
    end

    def destroy
        Story.destroy(params[:id])
    end

    private

    def story_params
        params.require(:story).permit(:user_id, :image, :title, :content, :region, :country, :latitude, :longitude)
    end
    
end
