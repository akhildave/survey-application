class Picture < ActiveRecord::Base
    #attr_accessible  :image, :image_file_name 
	 
  	belongs_to :imageable, :polymorphic => true

  	has_attached_file :image, :styles => {
  	:thumb => "100x100#" ,
  	:medium => "290x320#",
  	:large => "465>"
  	},
  	:storage => :filesystem,
  	:url => "/assets/:class/:id/:style/:basename.:extension",
  	:path => ":rails_root/assets/:class/:id/:style/:basename.:extension",
  	:default_url => "350x150.jpg"

  	validates_attachment :image, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
 

end
