module Admin::UsersHelper

  #required to access devise registration form from other controller - resource
  def resource_name
     :user
   end

   def resource
     @resource ||= User.new
   end

   def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
   end
   
end
