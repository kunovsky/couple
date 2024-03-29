class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :relationship_id
      t.boolean :taken, null: false, default: false
      t.string :email
      t.string :phone
      t.string :first_name
      t.string :auth_token

      t.timestamps
    end
  end
end
