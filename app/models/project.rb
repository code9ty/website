class Project < ApplicationRecord
  has_and_belongs_to_many :users
  validates :title, length: { minimum: 4 }
  validates :link, length: { minimum: 4 }
  validates_format_of :link, :with => URI.regexp
end
