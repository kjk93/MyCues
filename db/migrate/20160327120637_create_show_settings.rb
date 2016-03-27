class CreateShowSettings < ActiveRecord::Migration
  def change
    create_table :show_settings do |t|
      t.decimal :cue_time, default: 3
      t.decimal :cue_number_gap, default: 2
      t.integer :start_cue, default: 1

      t.timestamps null: false
    end
  end
end
