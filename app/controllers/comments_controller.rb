class CommentsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    if user.comments.create(comment_params)
      redirect_to user
    else
      redirect_to user
      binding.pry
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:learnt, :problem, :rating, 
                                    :user_id, :suggestions, :possible_fix)
  end
end
