class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :comp_name
      t.boolean :points_flag
      t.boolean :sets_flag
      t.boolean :mvp_flag

      t.timestamps
    end
  end
end
