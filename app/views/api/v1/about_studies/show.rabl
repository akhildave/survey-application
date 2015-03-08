 child @about => :about do 
    attributes :id, :heading, :subheading, :description1, :description2, :description3 
   node(:image_url){|image| image.image_url(:thumb)}
 end
 