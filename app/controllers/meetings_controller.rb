class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
    # @meetings = @meetings.where('lower(city) = ?', params[:where].downcase) if params[:where].present?
    # if params[:category].present?
    #   category = Meeting.find(params[:category])
    #   @meetings = @meetings.where(category_id: category.id)
    # end

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
    params.require(:meeting).permit(:city, :location, :duration, :group_size, :name, :category)
  end

end


