class StaticPagesController < ApplicationController
  def home
    @applicant = Applicant.new
  end
end
