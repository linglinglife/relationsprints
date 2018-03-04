class Card < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :sprint, optional: true

  has_many :tasks
  has_many :comments

  enum sentiment: [:positive, :negative, :neutral]

end
