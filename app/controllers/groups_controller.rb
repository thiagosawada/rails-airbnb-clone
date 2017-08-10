class GroupsController < ActionController::Base
  before_action :set_user, only: [:show]

  def index
    @group = Group.all
  end

  def new

  end

  def create
    @meeting = Meeting.find(params[:group][:id])
    if @meeting.groups.any? {|group| group.user == current_user }
      flash[:alert] = "Voce ja faz parte deste grupo!"
    else
      @group = Group.new
      @group.user = current_user
      @group.meeting = @meeting
      @group.save
    end
    redirect_to meeting_path(@meeting)
  end

  def edit
  end

  def update
  end

  def destroy
    @meeting = Meeting.find(params[:meeting_id])
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to meeting_path(@meeting)
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:meeting)
  end

end
