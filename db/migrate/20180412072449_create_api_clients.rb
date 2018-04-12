class CreateApiClients < ActiveRecord::Migration[5.2]
  def change
    create_table :api_clients do |t|
      t.string :name
      t.string :description
      t.string :contact_person
      t.string :contact_email
      t.string :client_id
      t.string :client_secret
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
