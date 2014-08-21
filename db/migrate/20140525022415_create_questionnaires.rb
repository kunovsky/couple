class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :title
      t.integer :cutoff_score
      t.integer :ok_score

      t.timestamps
    end
  end
end
