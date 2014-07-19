class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :questionnaire_id

      t.timestamps
    end
  end
end
