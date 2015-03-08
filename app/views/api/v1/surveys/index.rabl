child @surveys, :object_root => true do
  attributes *Mission.column_names
    child :survey_sections, :object_root => true   do
      attributes *SurveySection.column_names
      
          child :questions, :object_root => true   do
              attributes *Question.column_names
             child :question_type, :object_root => true   do
                 attributes :id, :text, :display_type, :pick, :part_of_group, :response_class,:group_display_type 
             end
             child :answers, :object_root => true   do
                 attributes *Answer.column_names
             end
          end
          
          
    end
end