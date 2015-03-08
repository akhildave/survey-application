class Api::V1::UsersController < ApplicationController
   #prepend_before_filter :get_api_key
  before_filter :authenticate_user!

  respond_to :json

  # GET /outlet_types
  def index 
    @users = User.all  
    #render json: users, status: :ok
  end

  def users_missions
     @usersmissions = UsersMission.all 
  end
  
  # private
  #  def get_api_key
  #    if api_key = params[:api_key].blank? && request.headers["X-API-KEY"]
  #      params[:api_key] = api_key
  #    end
  #  end

end