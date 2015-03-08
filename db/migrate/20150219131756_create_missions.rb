class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :contact
      t.integer :country_id  
      t.boolean :active

      t.timestamps
    end
  end
end
