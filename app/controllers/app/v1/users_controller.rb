class Api::V1::UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        if @user
            render json: @user
        else
            render json: {message: 'user not found'}
        end
    end

    def update
        @user = User.find(user_params[:id])
        if @user.update(user_params)
            render json: @user, status: 200
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: 200
        else
            render json: {message: 'user not created'}
        end
    end

    def destroy
        @user = User.find(user_params[:id])
        if @user.destroy
            render body: {}, status: :no_content
        else
            render json: {message: 'Error deleting user'}
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :picture, :id)
    end
end
