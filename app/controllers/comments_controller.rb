class CommentsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    @comments = user.comments.new(comment_params)
    if @comments.save
      redirect_to user
      flash[:success] = "Thanks for your feedback"
    else
      flash[:alert] = "There was a problem sending feedback"
      redirect_to user
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:learnt, :problem, :rating, 
                                    :user_id, :suggestions, :possible_fix)
  end
end
