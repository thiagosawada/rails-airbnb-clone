class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
    @meetings_geo = Meeting.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@meetings_geo) do |meeting, marker|
      marker.lat meeting.latitude
      marker.lng meeting.longitude
    end
  end

  def new
    @meeting = Meeting.new
  end

  def create
    # @meeting = current_user.meetings.new(meeting_params)
    # igual a de baixo
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    if @meeting.save!
      redirect_to user_path(@meeting.user)
    else
      render :new
    end
  end

  def update
    @meeting.update(meeting_params)
    redirect_to user_path
  end

  def show
    @meeting = Meeting.find(meeting_params)
  end

  def destroy
    @meeting.destroy
    redirect_to user_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:city, :location, :duration, :group_size)
  end

end


