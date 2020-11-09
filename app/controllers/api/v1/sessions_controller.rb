class Api::V1::SessionsController < Devise::SessionsController
    respond_to :json

    def auto_login
        token = request.headers['Authorization'].split(" ").last
        return head :unauthorized unless token
        begin
            payload = JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY'], true, algorithm: 'HS256')
        rescue JWT::ExpiredSignature => exception
            return render json: {message: 'token expired, please login again'}
        end
        jti = payload.first['jti']
        @user = User.find_by(jti: jti )
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
        
    end
  end