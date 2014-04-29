class AddDivisionIndex < ActiveRecord::Migration
  def change
    add_index :divisions, :division_name, unique: true 
  end
end
