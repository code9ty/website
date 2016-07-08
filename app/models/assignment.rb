class Assignment < ApplicationRecord
  validates :title, presence: true
  validates_format_of :link, :with =>  URI.regexp
  validates :link, presence: true
end
