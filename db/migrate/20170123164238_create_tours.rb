class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.timestamp :date_debut
      t.timestamp :date_fin

      t.timestamps
    end
  end
end
