class AddLimitToDecimals < ActiveRecord::Migration
  def change
  	change_column :cues, :follow_time, :decimal, {precision: 7, scale: 2 }
  	change_column :cues, :number, :decimal, {precision: 7, scale: 2 }
  	change_column :cues, :time, :decimal, {precision: 7, scale: 2 }
  end
end
