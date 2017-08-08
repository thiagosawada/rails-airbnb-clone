class PagesController < ApplicationController

  def home
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def  create
  end

end
