class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  def auto_login
    token = request.headers['Authorization'].split(' ').last
    begin
      payload = JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY'], true, algorithm: 'HS256')
      # JWT::ExpiredSignature (Signature has expired): still causes break
    rescue JWT::VerificationError || JWT::ExpiredSignature
      return render json: { message: 'token expired, please login again' }
    end
    jti = payload.first['jti']
    @user = User.find_by(jti: jti)
    if @user
      render json: @user
    else
      render json: { message: 'user not found from token' }
    end
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end
end
