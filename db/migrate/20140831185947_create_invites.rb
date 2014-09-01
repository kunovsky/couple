class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :user_id
      t.string :invite_token
      t.datetime :invite_sent_at
    end
  end
end