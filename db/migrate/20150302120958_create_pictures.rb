class CreatePictures < ActiveRecord::Migration

  def change
    create_table :pictures do |t|
      t.string :caption
      t.integer :imageable_id
      t.integer :imageable_type

      t.references :imageable, :polymorphic => true 
      t.attachment :image

      t.timestamps
    end
  end
  
end
