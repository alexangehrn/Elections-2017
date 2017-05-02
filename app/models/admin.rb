class Admin < ApplicationRecord

  validates :login, presence: true
  validates :password, presence: true
  validates :statut, presence: true

  def self.authenticate(login, password)
    admin = find_by_password(password)
    if admin && admin.login == login
      admin
    else
      nil
    end
  end

end
