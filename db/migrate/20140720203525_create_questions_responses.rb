class CreateQuestionsResponses < ActiveRecord::Migration
  def change
    create_table :questions_responses do |t|
      t.integer :question_id
      t.integer :possible_response_id

      t.timestamps
    end
  end
end
