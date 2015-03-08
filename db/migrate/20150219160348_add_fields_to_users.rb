class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :integer
    add_column :users, :locale, :string 
    #add_column :users, :mission_ids, :integer, array:true, default: []
    add_index :users, :username,  unique: true
  end

end
