class User < ApplicationRecord

  has_many :cards
  has_many :sprints, through: :cards
  has_many :tasks
  has_many :comments

  has_secure_password

  validates :email, presence: true, uniqueness: true

  enum relationship_status: [:single, :dating, :married]

end
