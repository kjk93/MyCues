class AddStartCueUserSetting < ActiveRecord::Migration
  def change
  	add_column :user_settings, :start_cue, :integer, default: 1
  end
end
