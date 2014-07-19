class CreateCompletedQuestionnaires < ActiveRecord::Migration
  def change
    create_table :completed_questionnaires do |t|
      t.integer :user_id
      t.integer :questionnaire_id
      t.json :score

      t.timestamps
    end
  end
end
