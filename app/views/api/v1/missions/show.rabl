child @mission, :object_root => true do
  attributes *Mission.column_names
  
  child :surveys, :object_root => true do
    attributes :id, :name
  end
  child :about_study, :object_root => true do
    attributes *AboutStudy.column_names
    node(:image_url){|image| image.image_url(:thumb)}
  end
end