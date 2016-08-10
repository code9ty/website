class Applicant < ApplicationRecord
  attr_reader :university, :year_of_study
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile_number, presence: true, numericality: true
  validates :email, presence: true, 
    format: { with: REGEX}, uniqueness: true
  validates :github, presence: true, length: { minimum:15 },
    uniqueness: true
  enum status: { apply: 0, accept: 1 }
end
