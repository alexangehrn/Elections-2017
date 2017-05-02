class User < ApplicationRecord

  validates :name, presence: true
  validates :forname, presence: true
  validates :encrypted_code, presence: true
  validates :postal, presence: true
  validates :bureau, presence: true

def self.authenticate(name, encrypted_code)
  user = find_by_encrypted_code(encrypted_code)
  if user && user.name == name
    user
  else
    nil
  end
end


end
