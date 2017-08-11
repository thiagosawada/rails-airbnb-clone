class ReviewsController < ApplicationController

  def new
  end

  def create
    # @meeting = current_user.meetings.new(meeting_params)
    # igual a de baixo
    @review = Review.new(review_params)
    if @review.save
      redirect_to user_path(@review.coach_id)
    else
      render :new
    end
  end

  private



  def review_params
    params.require(:review).permit(:head, :description, :rating, :user_id, :coach_id)
  end
end
