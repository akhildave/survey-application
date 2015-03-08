class Admin::BaseController < ApplicationController
  before_filter :require_admin
  layout "admin"

  def index
    @missions_count = Mission.all.size
    @users_count = User.all.size
  end

  protected

  def require_admin
    unless current_user.try(:admin?)
      #render404 and return false
      redirect_to main_app.root_path, :alert => "Unauthoried Access"
    end
  end

end
