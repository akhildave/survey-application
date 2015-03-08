SurveyorGui::Models::QuestionTypeMethods.module_eval do


  def _process_answers_textbox(question, args)
    is_exclusive  = args[:is_exclusive]
    other         = args[:other]
    is_comment    = args[:comments]
    omit_text     = is_exclusive ? "\n"+args[:omit_text].to_s : ""
    other_text    = other        ? "\n"+args[:other_text].to_s : ""
    comments_text = is_comment   ? "\n"+args[:comments_text].to_s : ""
    answers_textbox   = args[:answers_textbox]
    
    ##### Handle Default answer display_order
    # default answer is created without display order. Remove it or update its display_order - fix.
    question.answers.each_with_index {|a, index| 
      # if a.display_order.nil?
      #   a.display_order = 0
      # else
      #   a.display_order = question.answers.size > 0 ? question.answers.last.display_order+1 : 0
      # end
      a.destroy
    }   
    ##### Handle Default answer - End
    
    updated_answers = TextBoxParser.new(
      textbox: answers_textbox,
      records_to_update: question.answers
    )
 

    updated_answers.update_or_create_records do |display_order, text| 
      _create_an_answer(display_order, text, question) if !display_order.nil?
    end 
     
    _create_an_other_answer(question, other, other_text)
    _create_an_omit_answer(question, is_exclusive, omit_text)
    _create_a_comment_answer(question, is_comment, comments_text)
  end
  
  def _create_an_answer(display_order, new_text, current_question, args={})
     params = {
       question_id: current_question.id,
       display_order: display_order,
       text: new_text
     }.merge(args)

     Answer.create!(params)
   end



  def _create_an_other_answer(question, other, other_text, column_id=nil)
 
    if other
      display_order = 0  
      #display_order = question.answers.last.display_order+1 if question.answers.present?
       display_order = question.answers.size > 0 ? question.answers.last.display_order+1 : 0
      _create_an_answer(display_order, other_text, question, response_class: "string", column_id: column_id)
    end
  end

  def _create_an_omit_answer(question, is_exclusive, omit_text)
 
    if is_exclusive
      display_order = question.answers.size > 0 ? question.answers.last.display_order+1 : 0
      _create_an_answer(display_order, omit_text, question, is_exclusive: is_exclusive)
    end
  end

  def _create_a_comment_answer(question, is_comment, comments_text)
   
    if is_comment
      display_order = question.answers.order('display_order ASC').last.display_order
      answer = _create_an_answer(display_order, comments_text, question, response_class: "string", is_comment: true)
    end
  end

      
end
 