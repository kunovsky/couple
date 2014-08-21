class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :relationship_id
      t.json :analyses

      t.timestamps
    end
  end
end
