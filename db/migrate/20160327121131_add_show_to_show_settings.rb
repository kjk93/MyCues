class AddShowToShowSettings < ActiveRecord::Migration
  def change
    add_reference :show_settings, :show, index: true, foreign_key: true
  end
end
