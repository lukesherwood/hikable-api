class Api::V1::ReviewsController < ApplicationController

    def index
        @hike = Hike.find(params[:hike_id])
        @reviews = @hike.reviews
        # options = { include: [:user.name], fields: { user: [:name] } }
        render json: @reviews
      end

      def create
        @hike = Hike.find(params[:hike_id])
        @user = User.find_by(id: review_params[:user_id])
        review = @hike.reviews.build(review_params)
        binding.pry
        if params[:review][:images].present?
          params[:review][:images].each do |image|
            image_url = { :image => (url_for image) }
            image.attributes.merge(image_url)
            review.images.attach(image)
          end
        end
        # review.name = @user.username
        # options = { include: [:comments], fields: { comments: {user: [:name]} } }
        if review.save
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
