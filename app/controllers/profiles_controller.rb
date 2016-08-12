class ProfilesController < ApplicationController
  def index
    @users = User.all
  end
end
