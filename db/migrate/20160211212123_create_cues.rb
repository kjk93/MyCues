class CreateCues < ActiveRecord::Migration
  def change
    create_table :cues do |t|
      t.decimal :number
      t.decimal :time
      t.integer :follow
      t.decimal :follow_time
      t.boolean :auto_follow
      t.string :purpose
      t.string :called
      t.integer :page
      t.references :show, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
