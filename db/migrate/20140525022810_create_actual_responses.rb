class CreateActualResponses < ActiveRecord::Migration
  def change
    create_table :actual_responses do |t|
      t.json :responses
      t.integer :user_id

      t.timestamps
    end
  end
end
