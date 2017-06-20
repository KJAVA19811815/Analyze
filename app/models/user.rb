class User < ActiveRecord::Base
  has_secure_password
  has_many :answers

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :income, presence: true

end
