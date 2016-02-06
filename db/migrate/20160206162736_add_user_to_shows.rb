class AddUserToShows < ActiveRecord::Migration
  def change
    add_reference :shows, :user, index: true, foreign_key: true
    add_index :shows, [:user_id, :created_at]
  end
end
