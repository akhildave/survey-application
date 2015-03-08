module Api
  module V1
    module CustomDevise
      class SessionsController < Devise::SessionsController
        # skip_before_action :verify_authenticity_token
        skip_before_filter :verify_authenticity_token  
        prepend_before_filter :require_no_authentication, :only => [:create ]
        #include Devise::Controllers::Helpers
 
        respond_to :json
 
        def create 
          self.resource = warden.authenticate!(:scope => :user)
          sign_in(resource_name, resource)
          resource.reset_authentication_token!
          resource.save!
          render json: {
            user_id: resource.id,
            auth_token: resource.authentication_token,
            user_role: resource.role,
            user_name: resource.name,
            user_locale: resource.locale
            
          }
        end
 
        def destroy
          #sign_out(resource_name)
          # resource = User.find_by_authentication_token(params[:auth_token]||request.headers["X-AUTH-TOKEN"])
#            resource.authentication_token = nil
#            resource.save
#            sign_out(resource_name)
#            render :json => {}.to_json, :status => :ok
           
          begin
            @user=User.where(:authentication_token => params[:auth_token]).first
            @user.reset_authentication_token!
          rescue    
            render :json => { :notice => "User not found with token provided." } 
          end 
          render :json => { :notice => "Logged out successfully." } 
        end
 
      end
    end
  end
end