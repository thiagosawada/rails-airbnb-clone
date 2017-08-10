class PagesController < ApplicationController

  def home
    @meetings = Meeting.all
    @users = User.all
  end



end
