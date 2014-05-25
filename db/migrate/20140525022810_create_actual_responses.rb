class CreateActualResponses < ActiveRecord::Migration
  def change
    create_table :actual_responses do |t|
      t.integer :possible_response_id
      t.integer :user_id

      t.timestamps
    end
  end
end
