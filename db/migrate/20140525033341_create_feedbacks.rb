class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :relationship_id
      t.integer :survey_id
      t.integer :result_id

      t.timestamps
    end
  end
end
