class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :id_candidate
      t.integer :code_postal
      t.integer :bureau_de_vote
      t.integer :id_tour
      t.boolean :vote_validation

      t.timestamps
    end
  end
end
