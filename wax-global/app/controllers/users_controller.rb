class UsersController < ApplicationController

    def create
        
        user = User.create(user_params)
        
        if user
            render json: {user:user, token:issue_token({id: user.id})}
            #    render json: user
        else
            render user.errors.full_messages.as_json, status: 400 #catch this on the front end
        end

    end

    def show
        user = User.find(params[:id])
        render json: {user: user, stories: user.stories}
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: {user: user, stories: user.stories}
    end

    def destroy
        User.destroy(params[:id]) 
    end

    def user_favourites
        user = get_current_user
        favourites = user.favourites
        favourite_stories = favourites.map{|fave| [fave.story, fave.story.user, fave]}
        render json: favourite_stories
    end

    def user_stories
        user = get_current_user
        render json: user.stories
    end

    def login
        user = User.find_by(username: params[:user][:username])
        if user and user.authenticate(params[:user][:password])
            render json: {user: user, token:issue_token({id: user.id})}
        else
            render json: {error: 'Username/Password invalid'}, status: 403
        end
    end

    def validate
        user = get_current_user
        if user
            render json: {user: user, token:issue_token({id: user.id}) }
        else
            render json: {error: 'Not Authorized'}, status: 401
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :image, :bio)
    end
end
