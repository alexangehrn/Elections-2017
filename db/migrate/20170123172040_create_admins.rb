class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :login
      t.string :password
      t.boolean :statut

      t.timestamps
    end
  end
end
