class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.integer :grouping_id
      t.string :title
      t.integer :cutoff_score
      t.integer :ok_score
      t.float :weight

      t.timestamps
    end
  end
end
