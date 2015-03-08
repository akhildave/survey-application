class AddMissionIdToSurvey < ActiveRecord::Migration 
  def self.up
    add_column :surveys, :mission_id, :integer
  end

  def self.down
    remove_column :surveys, :mission_id
  end
end
