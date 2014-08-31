class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :questionnaire_id
      t.string :quadrant_type
      t.string :overall
      t.text :content
      t.text :recommendation
      
      t.timestamps
    end
  end
end

