class BidsController < ApplicationController
  before_action :admin?, except: [:create]
  def create
    @bid = Bid.new(bid_params)
    begin
    if @bid.save
      redirect_to projects_path
      flash[:success] = "You have requested for this project. A confirmation Email will be sent once approved"
    else
      redirect_to projects_path
      flash[:alert] = "Something went wrong try again"
    end
    rescue
      flash[:alert] = "You have already requested for this project"
      redirect_to projects_path
    end
  end

  def index
    @requested = Bid.requested
    @assigned = Bid.assigned
  end

  def assign
   bid = Bid.find(params[:bid]) 
   due_date = Time.zone.now + params[:days].to_i.days
   if bid.update_attributes(status: "assigned", due_date: due_date)
     flash[:success] = "#{bid.user.full_name} has been successfully assigned this project"
   else
     flash[:alert] = "There was a problem assigning the project"
   end
   redirect_to bids_path
  end


  private

  def bid_params
    params.require(:bid).permit(:user_id, :project_id)
  end
end

