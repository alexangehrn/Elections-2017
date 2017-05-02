class Tour < ApplicationRecord

  validates :date_debut, presence: true
  validates :date_fin, presence: true
end
