class Candidate < ApplicationRecord

  validates :nom, presence: true
  validates :prenom, presence: true
  validates :affiliation, presence: true
  validates :photo, presence: true
  validates :descriptif, presence: true

	has_many :votes
	
end
