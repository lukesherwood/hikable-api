class Api::V1::RegistrationsController < Devise::SessionsController
    respond_to :json
  end