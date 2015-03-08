class Api::V1::AboutStudiesController < ApplicationController 
  before_filter :authenticate_user!
  respond_to :json

  # GET /outlet_types
  def index 
    @about = AboutStudy.all   
  end 

  def show
    @about = AboutStudy.find(params[:id])
  end
end