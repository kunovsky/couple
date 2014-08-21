class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :questionnaire_id
      t.string :content

      t.timestamps
    end
  end
end
