class CreatePossibleResponses < ActiveRecord::Migration
  def change
    create_table :possible_responses do |t|
      t.string :content
      t.integer :point_value

      t.timestamps
    end
  end
end
