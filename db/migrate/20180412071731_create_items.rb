class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :order, null: false, default: 1
      t.string :image
      t.decimal :price, precision: 5, scale: 2, null: false, default: 0.0
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
