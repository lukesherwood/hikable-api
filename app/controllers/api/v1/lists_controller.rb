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
        if hike_params[:hike_id]
            @hike = Hike.find(hike_params[:hike_id]) # if a hike is sent with the params
            if @list.hikes.find_by(id: @hike.id) #if the hike already exists in that list
                return render json:{message: 'Hike is already on that list'}, status: :unprocessable_entity
            end
            @list.hikes << @hike
        end
        if @list.update(list_params)
            render json: @list, status: 200
        end
    end

    def create
        @list = List.new(list_params)
        if @list.save
            render json: @list, status: :created
          else
            render json: @list.errors, status: :unprocessable_entity
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

    def hike_params
        params.require(:hike).permit(:hike_id)
    end
end
