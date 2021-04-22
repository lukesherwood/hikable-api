class Api::V1::HikesController < ApplicationController
  def index
    @hikes = Hike.filter(params.slice(:difficulty, :duration, :keyword))
    @hikes = @hikes.paginate(page: page)
    render json: {
      hikes: @hikes,
      page: @hikes.current_page,
      pages: @hikes.total_pages
    }
  end

  def home
    render json: { hike: true }, status: 200
  end

  def show
    @hike = Hike.find(params[:id])
    if @hike
      render json: @hike
    else
      render json: { message: 'Hike not found' }
    end
  end

  def update
    @hike = Hike.find(hike_params[:id])
    render json: @hike, status: 200 if @hike.update(hike_params)
  end

  def create
    @hike = Hike.new(hike_params)
    if @hike.save
      render json: @hike, status: 200
    else
      render json: { message: 'Hike not created' }
    end
  end

  def remove_hike_list
    @hike = Hike.find(params[:id])
    @list = List.find(hike_params[:list_id])
    if @list.hikes.find_by(id: @hike.id)
      @list.hikes.delete(@hike)
      render json: @list, status: 200
    else
      render json: { message: 'Error deleting hike' }
    end
  end

  def destroy
    @hike = Hike.find(hike_params[:id])
    if @hike.destroy
      render body: {}, status: :no_content
    else
      render json: { message: 'Error deleting hike' }
    end
  end

  private

  def page
    params[:page] || '1'
  end

  def hike_params
    params.require(:hike).permit(:title, :description, :id, :location, :difficulty, :duration, :length, :photo,
                                 :directionURL, :routeURL, :current_page, :total_pages, :list_id, :duration_category,
                                 :dog_friendly, :region, :coordinates) 
  end
end
