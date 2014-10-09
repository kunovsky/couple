class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.json :data, null: false, default: {}
      t.json :summary, null: false, default: {}

      t.timestamps
    end
  end
end
