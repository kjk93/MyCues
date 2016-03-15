class AddDefaultCueTimeToUser < ActiveRecord::Migration
  def change
    add_column :users, :default_cue_time, :decimal, default: 3
  end
end
