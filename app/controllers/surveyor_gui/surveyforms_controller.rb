
class SurveyorGui::SurveyformsController < Admin::BaseController
  include Surveyor::SurveyorControllerMethods
  include SurveyorGui::SurveyformsControllerMethods
  
  
  def create
    @surveyform = Surveyform.new(surveyforms_params.merge(user_id: @current_user.nil? ? @current_user : @current_user.id))
 
    
    if @surveyform.save
      flash[:notice] = "Successfully created survey."
      @title = "Edit Survey"
      @question_no = 0
      redirect_to edit_surveyform_path(@surveyform.id)
    else
      render :action => 'new'
    end
  end
  
  
  def destroy
    @surveyform = Surveyform.find(params[:id])
    response_sets_total = @surveyform.response_sets.count
    
      if response_sets_total > 0
        flash[:error] = 'This survey has responses and can not be deleted' 
      elsif response_sets_total== 0
        if @surveyform.destroy
          flash[:notice] = "Successfully destroyed survey." 
        else
          flash[:error] = "Problem Deleting survey." 
        end
      else
        flash[:error] = 'Survey could not be deleted.'
      end
      redirect_to surveyforms_url
    
  end
  

  private
  def surveyforms_params
    ::PermittedParams.new(params[:surveyform]).extend(AttributePermitter).survey
  end
  
  
 

end