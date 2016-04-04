class AddQuickToShowSetting < ActiveRecord::Migration
  def change
    add_column :show_settings, :quick, :boolean, default: false
  end
end
