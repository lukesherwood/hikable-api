class Api::V1::SessionsController < Devise::SessionsController
    respond_to :json
  end