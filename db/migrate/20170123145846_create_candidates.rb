class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :nom
      t.string :prenom
      t.string :affiliation
      t.string :photo
      t.text :descriptif

      t.timestamps
    end
  end
end
