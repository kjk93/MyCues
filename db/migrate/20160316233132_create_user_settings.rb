class CreateUserSettings < ActiveRecord::Migration
  def change
    create_table :user_settings do |t|
      t.decimal :cue_time, default: 3
      t.decimal :cue_number_gap, default: 2

      t.timestamps null: false
    end
  end
end
