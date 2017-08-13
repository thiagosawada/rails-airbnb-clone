class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all

    if params[:where].present?
      @meetings = @meetings.where('lower(city) = ?', params[:where].downcase)

    end

    if params[:category].present?
      category = Category.where('name = ?', params[:category].downcase)
      @meetings = @meetings.where('category_id = ?', category.ids)

    end

    if params[:date].present?
      date = Date.parse(params[:date])
      @meetings = @meetings.where(date: date.beginning_of_day..date.end_of_day)
    end

    @hash = Gmaps4rails.build_markers(@meetings) do |meeting, marker|
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

    @meeting.duration = meeting_params[:duration][/\d/]
    @meeting.user = current_user

    if @meeting.save
      MeetingMailer.creation_confirmation(@meeting).deliver_now
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
    @review = Review.new
    @reviews = Review.all
    @meeting = Meeting.find(params[:id])

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
    redirect_to meeting_path(current_user.id)
  end

  private

  def find_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:city, :location, :duration, :category_id, :group_size, :name, :description, :date, :photo, :photo_cache)
  end

end


