class GroupsController < ActionController::Base
  before_action :set_user, only: [:show]

  def index
    @group = Group.all
  end

  def new

  end

  def create
    @meeting = Meeting.find(group_params[:meeting])
    @group = Group.new
    @group.user = current_user
    @group.meeting = @meeting
    @group.save
    redirect_to meeting_path(@meeting)
  end

  def edit
  end

  def update
  end

  def destroy
  end


private

  def set_user
    @user = User.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:meeting)
  end

end
