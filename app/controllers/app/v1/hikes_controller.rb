class App::V1::HikesController < ApplicationController
    def index
        @hikes = Hike.all
        render json: @hikes
    end

    def show
        @hike = Hike.find(params[:id])
        if @hike
            render json: @hike
        else
            render json: {message: 'Hike not found'}
        end
    end

    # def edit
    # end

    def update
        @hike = Hike.find(hike_params[:id])
        if @hike.update(hike_params)
            render json: @hike, status: 200
        end
    end

    def create
        @hike = Hike.new(hike_params)
        if @hike.save
            render json: @hike, status: 200
        else
            render json: {message: 'Hike not created'}
        end
    end

    def destroy
        @hike = Hike.find(hike_params[:id])
        if @hike.destroy
            render body: {}, status: :no_content
        else
            render json: {message: 'Error deleting hike'}
        end
    end

    private

    def hike_params
        params.require(:hike).permit(:title, :description, :id, :location, :difficulty, :duration, :length, :photo, :directionURL, :routeURL)
    end
end
