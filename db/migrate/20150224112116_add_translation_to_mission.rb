class AddTranslationToMission < ActiveRecord::Migration
  def up 
      Mission.create_translation_table! :name => :string, :description => :text
    end
    def down 
      Mission.drop_translation_table!
    end
end
