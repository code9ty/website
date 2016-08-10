class Applicant < ApplicationRecord
  attr_reader :first_name, :last_name, :university, :year_of_study, :mobile_number
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, 
    format: { with: REGEX}, uniqueness: true
  validates :github, presence: true, length: { minimum:15 },
    uniqueness: true
  enum status: { apply: 0, accept: 1 }
end
