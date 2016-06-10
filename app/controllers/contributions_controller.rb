class ContributionsController < ApplicationController
  def index
    @contributions = Contribution.all
    @users = User.all
  end
  def new
  end
end
