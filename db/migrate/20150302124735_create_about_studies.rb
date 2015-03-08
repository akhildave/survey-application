class CreateAboutStudies < ActiveRecord::Migration 
  def self.up
    create_table :about_studies do |t|
      t.text :description1
      t.text :description2
      t.text :description3
      t.string :heading
      t.string :subheading
      t.integer :mission_id
      t.boolean :interest

      t.timestamps
    end
     
    
  end

  def self.down
    drop_table :about_studies 
  end 
  
 
  
end
