class Api::V1::ListsController < ApplicationController
  before_action :authenticate_user!
  def index
    # move to application helper as used also in sessions
    token = request.headers['Authorization'].split(' ').last
    payload = JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY'], true, algorithm: 'HS256')
    jti = payload.first['jti']
    @user = User.find_by(jti: jti)
    @lists = List.where(user_id: @user.id)
    render json: @lists
  end

  def show
    @list = List.find(params[:id])
    if @list
      render json: @list
    else
      render json: { message: 'list not found' }
    end
  end

  def update
    @list = List.find(list_params[:id])
    if hike_params[:hike_id]
      @hike = Hike.find(hike_params[:hike_id])
      @list.hikes << @hike
    end
    render json: @list, status: 200 if @list.update(list_params)
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
      render json: {}, status: :accepted
    else
      render json: { message: 'Error deleting list' }
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
