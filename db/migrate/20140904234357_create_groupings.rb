class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.string :name
    end
  end
end
