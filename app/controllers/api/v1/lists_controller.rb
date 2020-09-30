class Api::V1::ListsController < ApplicationController
    before_action :authenticate_user!
    def index
        @lists = List.all
        render json: @lists
    end

    def show
        @list = List.find(params[:id])
        if @list
            render json: @list
        else
            render json: {message: 'list not found'}
        end
    end

    # def edit
    # end

    def update
        @list = List.find(list_params[:id])
        if @list.update(list_params)
            render json: @list, status: 200
        end
    end

    def create
        @list = List.new(list_params)
        if @list.save
            render json: @list, status: 200
        else
            render json: {message: 'list not created'}
        end
    end

    def destroy
        @list = List.find(list_params[:id])
        if @list.destroy
            render body: {}, status: :no_content
        else
            render json: {message: 'Error deleting list'}
        end
    end

    private

    def list_params
        params.require(:list).permit(:name, :user_id, :id, :description)
    end
end
