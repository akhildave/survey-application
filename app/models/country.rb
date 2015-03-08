class Country < ActiveRecord::Base
  has_many :missions
  has_many :languages
  
  #validations
  validates_presence_of :name
  validates_presence_of :code
end
