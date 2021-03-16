class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    # def create
    #     @user = User.create(user_params)
    #     render json: @user
    # end

    # Basic example of error handling
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render status: 418
        end
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit([:name, :username, :email])
    end

end
