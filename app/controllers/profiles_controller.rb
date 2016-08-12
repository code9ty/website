class ProfilesController < ApplicationController
  def pride
    @users = User.all
  end
end
