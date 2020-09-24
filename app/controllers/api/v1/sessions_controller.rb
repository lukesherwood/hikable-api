class Api::V1::SessionsController < Devise::SessionsController
    respond_to :json


    def auto_login
      token = request.headers['Authorization'].split(" ").last
      # return head :unauthorized unless token
      payload = JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY'], true, algorithm: 'HS256')
      jti = payload.first['jti']
      @user = User.find_by(jti: jti )
      # return head :unauthorized unless user
      # TODO set the `user` as current_user
      # How to patch devise's `current_user` helper is another story
      if @user
        render json: @user
      else
        render json: {message: 'user not found from token'}
      end
    end

    private
    def respond_with(resource, _opts = {})
      render json: resource
    end
    def respond_to_on_destroy
      head :ok
    end
  end