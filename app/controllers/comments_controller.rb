class CommentsController < ApplicationController
  before_action :logged_in_user
  # before_action :correct_user, only: [:index]
  def index
    @comments = current_user.comments.all if logged_in?
  end
  def create
    user = User.find(params[:user_id])
    @comments = user.comments.new(comment_params)
    if @comments.save
      redirect_to user
      flash[:success] = "Thanks for your feedback"
    else
      flash.now[:alert] = "There was a problem sending feedback"
      render 'new'
    end
  end

  def new
    
  end

  private

  def comment_params
    params.require(:comment).permit(:learnt, :problem, :rating, 
                                    :user_id, :suggestions, :possible_fix)
  end
end
