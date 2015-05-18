# encoding: UTF-8
module SurveyorControllerCustomMethods
  def self.included(base)
    # base.send :before_filter, :require_user   # AuthLogic
    # base.send :before_filter, :login_required  # Restful Authentication
    base.send :layout, 'surveyor_custom'
  end

  # Actions
  def new
    super 
    @title = "You can take these surveys - NEW"
  end
  def create
    super
  end
  def show
    super 
     @title = "You can take these surveys - SHOW"
  end
  def edit
    super 
    @title = "You can take these surveys  - EDIT"
  end
  def update
    super
  end

  # Paths
  def surveyor_index
    # most of the above actions redirect to this method
    super # surveyor.available_surveys_path
  end
  def surveyor_finish
    # the update action redirects to this method if given params[:finish]
    super # surveyor.available_surveys_path
  end
end
class SurveyorController < ApplicationController
  include Surveyor::SurveyorControllerMethods
  include SurveyorControllerCustomMethods
end
