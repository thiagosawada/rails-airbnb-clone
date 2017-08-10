class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all

    @hash = Gmaps4rails.build_markers(@meetings) do |meeting, marker|
      marker.lat meeting.latitude
      marker.lng meeting.longitude
    end

    if params[:where].present?
      @meetings = @meetings.where('lower(city) = ?', params[:where].downcase)

    end
    if params[:category].present?
      @meetings = @meetings.where('lower(category) = ?', params[:category].downcase)

    end

    if params[:date].present?
      date = Date.parse(params[:date])
      @meetings = @meetings.where(date: date.beginning_of_day..date.end_of_day)
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
    if @meeting.save
      redirect_to user_path(@meeting.user)
    else
      render :new
    end
  end

  def update
    @meeting.update(meeting_params)
    redirect_to user_path(current_user.id)
  end

  def show
    @meeting = Meeting.find(params[:id])
    # raise
    # has_group = @meeting.groups.any? {|group| group.user == current_user }
    group = @meeting.groups.select {|group| group.user == current_user }
    if group.empty?
      @group = Group.new
    else
      @group = group.first
    end

    @hash = Gmaps4rails.build_markers(@meeting) do |meeting, marker|
      marker.lat meeting.latitude
      marker.lng meeting.longitude
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def find_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:city, :location, :duration, :group_size, :name, :category, :description, :date, :photo, :photo_cache)
  end

end


