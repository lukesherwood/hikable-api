class Api::V1::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     payload= {user_id: @user.id}
  #     token = encode_token(payload)
  #       render json: {
  #         status: :created,
  #         user: @user,
  #         jwt: token
  #       }
  #       # need to return a jwt token aswell?
  #   else
  #       render json: {message: 'user not created'}
  #   end
  # end

end