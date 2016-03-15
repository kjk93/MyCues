class AddIndexToNumber < ActiveRecord::Migration
  def change
  	add_index :cues, :number
  end
end
