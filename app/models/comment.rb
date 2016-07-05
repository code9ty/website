class Comment < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :learnt, length: { minimum: 10 }
 validates :problem, length: { minimum: 10 }, allow_blank: true
 validates :suggestions, length: { minimum: 10 }, allow_blank: true
 validates :possible_fix, length:  { minimum: 10 }, allow_blank: true
end
