class AddTranslationToAboutStudy < ActiveRecord::Migration
  def self.up 
    AboutStudy.create_translation_table! :heading => :string, :subheading => :string, :description1 => :text,:description2 => :text,:description3 => :text 
  end

  def self.down 
    AboutStudy.drop_translation_table!
  end 
    
end
