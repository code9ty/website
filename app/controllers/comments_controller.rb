class CommentsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    # comment = Comment.new(comment_params)
    binding.pry
    if user.comments.create(comment_params)
      redirect_to user
    else
      redirect_to user
      console
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:learnt, :problem, :rating, :user_id)
  end
end
