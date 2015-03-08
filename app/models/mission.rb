class Mission < ActiveRecord::Base
  #globalize gem
  translates :name, :description
  
  #validations
  validates_presence_of :name
  
  #Associations
  belongs_to :country 
  has_many :users_mission
  has_many :users, :through => :users_mission 
  
  has_many :surveys
  has_one :about_study
  
  has_one :picture, :as => :imageable, :class_name=>"Picture", :dependent => :destroy
  accepts_nested_attributes_for :picture
    
  # For Storing Translations - Nested Attributes
  # Reject if mission- name is enpty for any language.
  accepts_nested_attributes_for :translations, :reject_if => proc { |attributes| attributes['name'].blank? }

end
