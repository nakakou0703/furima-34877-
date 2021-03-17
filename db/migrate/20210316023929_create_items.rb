class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name,          null: false
      t.text :text,            null: false
      t.references :user,      foreign_key: true
      t.integer :condition_id, null: false
      t.integer :charge_id,    null: false
      t.integer :source_id,    null: false
      t.integer :ship_day_id,  null: false
      t.integer :category_id,  null: false
      t.integer :price,        null: false
    end
  end
end