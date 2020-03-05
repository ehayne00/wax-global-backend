class StoriesController < ApplicationController

    def index
        stories = Story.all.order(id: :desc)
        render json: stories, include: [:user]
    end

    def create

        story = Story.create(user_id: params[:user_id], title: params[:title], content: params[:content], address: params[:address], latitude: params[:latitude], longitude: params[:longitude], country: params[:country])
        if params[:picture] != ""
            story.update(picture: params[:picture])
            # byebug
            story[:image] = url_for(story.picture)
        elsif params[:movie] != ""
            story.update(movie: params[:movie])
            story[:video] = url_for(story.movie)
        end
        
        story.save
        
        if story.valid?
            render json: story, include: [:user]
        else
            render json: {error: story.errors.full_messages}, status: 400 
        end 
    end

    def show
        story = Story.find(params[:id])
        render json: story, include: [:user]
    end

    def update
        story = Story.find(params[:id])
        story.update(user_id: params[:user_id], title: params[:title], content: params[:content], address: params[:address], latitude: params[:latitude], longitude: params[:longitude], country: params[:country])
        if params[:picture] != "null" && params[:picture] !=  story.image
            story.update(picture: params[:picture])
            story[:image] = url_for(story.picture)

        elsif params[:movie] != "null" && params[:movie] !=  story.video
            story.update(movie: params[:movie])
            story[:video] = url_for(story.movie)
        end
        story.save
        render json: story, include: [:user]
    end

    def destroy
        Story.destroy(params[:id])
    end

    private

    def story_params
        params.require(:story).permit(:user_id, :image, :video, :title, :content, :address, :latitude, :longitude, :country)
    end
    
end
