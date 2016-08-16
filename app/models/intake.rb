class Intake < ApplicationRecord
  def self.open?
    intake = Intake.last
    intake.start_date.past? && intake.last_date.future? if intake
  end
end
