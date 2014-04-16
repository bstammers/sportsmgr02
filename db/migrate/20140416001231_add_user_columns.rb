class AddUserColumns < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :phone, :string
    add_column :users, :avatar, :string
    add_column :users, :admin, :boolean
    add_column :users, :manager, :boolean
    
    add_index :users, :username, unique: true
  end
end
