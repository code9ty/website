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
  def send_sms(message)
    username = ENV['AT_USERNAME']
    apikey = ENV['AT_API']
    gateway = AfricasTalkingGateway.new(username, apikey)
    begin
      reports = gateway.sendMessage(mobile_number, message)
      reports.each {|x|
        # status is either "Success" or "error message"
        puts 'number=' + x.mobile_number + ';status=' + x.status + ';messageId=' + x.messageId + ';cost=' + x.cost
      }
    rescue AfricasTalkingGatewayException => ex
      puts 'Encountered an error: ' + ex.message
    end
  end
end
