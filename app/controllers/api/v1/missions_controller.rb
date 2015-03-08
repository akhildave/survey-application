class Api::V1::MissionsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
 
  def index 
    @missions = Mission.all   
  end 
  
  def show 
    @mission = Mission.find(params[:id])   
  end 

end