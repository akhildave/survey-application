module AttributePermitter
  # survey_attributes base method found in surveyor gem.
  # surveyor_gui gem override's survey_attributes method.
  # We extend method to include our parameters.  
  # More Details http://blog.jayfields.com/2008/04/alternatives-for-redefining-methods.html
  def survey_attributes
    super + [:mission_id]
  end
end   