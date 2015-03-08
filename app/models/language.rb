class Language < ActiveRecord::Base

  #validations
  validates_presence_of :name
  validates_presence_of :code
    validates_uniqueness_of :code
  
end
