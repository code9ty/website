class Bid < ApplicationRecord
  enum status: { requested: 0, assigned: 1, overdue: 2, finished: 3 }
  belongs_to :user
  belongs_to :project
end
