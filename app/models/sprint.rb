class Sprint < ApplicationRecord

  has_many :cards
  belongs_to :workspace, optional: true

end
