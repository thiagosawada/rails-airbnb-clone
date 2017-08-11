class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @reviews = @user.reviews
    @meetings = @user.meetings

    sum = 0

    @reviews.each do |review|
      sum += review.rating
    end
    @average = sum / @reviews.size

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      redirect_to root_path
    else
      render :new
    end
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

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :about, :email, :user_city)
  end

end

