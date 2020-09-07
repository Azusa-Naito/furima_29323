class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :title,        null: false
      t.text    :text,         null: false
      t.integer :genre_id,     null: false
      t.integer :status_id,    null: false
      t.integer :bear_id,      null: false
      t.integer :price,        null: false
      t.integer :ship_from_id, null: false
      t.integer :days_id,      null: false
      t.integer :user_id,      null: false
      t.timestamps
    end
  end
end
