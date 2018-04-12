class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.belongs_to :user, foreign_key: true
      t.decimal :amount, precision: 5, scale: 2, null: false, default: 0.0

      t.timestamps
    end
  end
end
