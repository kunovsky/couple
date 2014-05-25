class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :relationship_id
      t.string :email
      t.string :first_name

      t.timestamps
    end
  end
end
