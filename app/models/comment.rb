class Comment < ApplicationRecord

  belongs_to :card, optional: true
  belongs_to :user, optional: true

end
