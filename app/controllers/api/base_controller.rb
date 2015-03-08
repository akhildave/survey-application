class Api::BaseController < ApplicationController
  # This is our new function that comes before Devise's one
  #before_filter :authenticate_user_from_token!
  include ActionController::MimeResponds
  include ActionController::StrongParameters 
  before_filter :authenticate_user!
  
  
  
  #Handle RecordNotFound errors
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {errors: [exception.message]}, status: :unprocessable_entity
  end
  
  
  private

  def permission_denied
    render json: { error: 'unauthorized' }, status: :unauthorized
  end 
  
end


#Base controller which inherited by every api controller 
#/controllers/api/base_controller.rb
# class Api::BaseController < InheritedResources::Base
#   before_filter :authenticate_user!
#   prepend_before_filter :get_auth_token
#
#   respond_to :xml, :json
#
#   private
#   def get_auth_token
#     if auth_token = params[:auth_token].blank? && request.headers["X-AUTH-TOKEN"]
#       params[:auth_token] = auth_token
#     end
#   end
# end