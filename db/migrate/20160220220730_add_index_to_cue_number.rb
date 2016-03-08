class AddIndexToCueNumber < ActiveRecord::Migration
  def change
  	add_index :cues, :number
  	change_column :cues, :number, :decimal, { scale: 2}
  	change_column :cues, :follow, :integer, { default: 0}
  end
end
