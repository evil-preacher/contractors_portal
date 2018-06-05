class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authenticate_request
  before_action :destroy_session
  skip_before_action :authenticate_user!

  attr_reader :current_user

  protected

  def destroy_session
    request.session_options[:skip] = true
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Non Authorized' }, status: 401 unless @current_user
  end
end
