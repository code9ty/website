class Comment < ApplicationRecord
  belongs_to :user
  validates :learnt, length: { minimum: 10 }
  validates :problem, length: { minimum: 10 }
  validates :suggestions, length: { minimum: 10 }
  validates :possible_fix, length: { minimum: 10 }
end
