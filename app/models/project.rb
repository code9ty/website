class Project < ApplicationRecord
  has_many :users, through: :bids
  has_many :bids
  validates :title, length: { minimum: 4 }
  validates :link, length: { minimum: 4 }
  validates_format_of :link, :with => URI.regexp
end
