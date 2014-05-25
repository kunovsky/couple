class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.integer :cutoff_score

      t.timestamps
    end
  end
end
