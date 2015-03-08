class Api::V1::SurveysController < ApplicationController 
 

  respond_to :json
 
  def index 
    @surveys = Survey.all   
    p @surveys
  end
   

end