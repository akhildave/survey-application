class CreateUsersMissions < ActiveRecord::Migration
  def change
    create_table :users_missions do |t|
      t.integer :user_id
      t.integer :mission_id

      t.timestamps
    end
  end
end
