class CreatePossibleResponses < ActiveRecord::Migration
  def change
    create_table :possible_responses do |t|
      t.integer :question_id
      t.string :content

      t.timestamps
    end
  end
end
