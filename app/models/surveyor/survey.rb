class Survey < ActiveRecord::Base
  include Surveyor::Models::SurveyMethods
  belongs_to :mission

  #validations
  #validates_presence_of :mission
  
  # def title
  #   "Custom #{super}"
  # end

end