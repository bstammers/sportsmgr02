class AddCompIndex < ActiveRecord::Migration
  def change
    add_index :competitions, :comp_name, unique: true 
  end
end
