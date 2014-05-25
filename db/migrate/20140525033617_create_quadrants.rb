class CreateQuadrants < ActiveRecord::Migration
  def change
    create_table :quadrants do |t|
      t.integer :survey_id
      t.integer :result_id
      t.integer :quadrant_number

      t.timestamps
    end
  end
end
