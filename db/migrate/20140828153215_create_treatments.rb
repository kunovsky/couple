class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.integer :result_id
      t.integer :product_id

      t.timestamps
    end
  end
end
