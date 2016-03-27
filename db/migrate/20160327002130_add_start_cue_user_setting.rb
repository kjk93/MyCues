class AddStartCueUserSetting < ActiveRecord::Migration
  def change
  	add_column :user_settings, :start_cue, :integer, default: 1
  	remove_column :users, :default_cue_time, :decimal
  end
end
