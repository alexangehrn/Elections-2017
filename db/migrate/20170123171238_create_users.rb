class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :forname
      t.string :encrypted_code
      t.string :postal
      t.integer :bureau
      t.boolean :tour1
      t.boolean :tour2
      t.boolean :active

      t.timestamps
    end
  end
end
