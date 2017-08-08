class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if meeting.save!
      redirect_to profiles_user_path(@meeting)
    else
      render :new
    end
  end

private

  def meeting_params
    params.require(:meeting).permit(:city, :location, :duration, :group_size)
  end

end


