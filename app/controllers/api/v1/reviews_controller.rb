class Api::V1::ReviewsController < ApplicationController

  def create
    @hike = Hike.find(params[:hike_id])
    @user = User.find_by(id: review_params[:user_id])
    if @hike.reviews.create(review_params)
      render json: @hike
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :hike_id, :name, :privacy, images: [])
  end
end
