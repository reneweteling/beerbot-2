class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :image
      t.string :slack_handle
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
