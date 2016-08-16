class StaticPagesController < ApplicationController
  def home
    @applicant = Applicant.new
    @open = Intake.open?
  end
end
