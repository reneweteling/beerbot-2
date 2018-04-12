class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :item, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
