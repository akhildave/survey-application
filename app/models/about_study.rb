class AboutStudy < ActiveRecord::Base
  #globalize gem
  translates :description1, :description2, :description3, :heading, :subheading
  accepts_nested_attributes_for :translations 
  
  #validations
  validates_presence_of :mission
  
  #picture 
  has_one :picture, :as => :imageable, :class_name=>"Picture", :dependent => :destroy
  accepts_nested_attributes_for :picture
  
  belongs_to :mission

  
  # def image_url(style='original')
  #   profile_picture.image_url(style)  rescue ProfilePicture.image_url(style, 'Parent')
  # end
  
  def image_url(style='original')
    ENV["domain"] + self.picture.image.url(:original) if self.picture.present?
  end
end
