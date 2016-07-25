require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @project = FactoryGirl.create(:project)
  end
  it 'creates a bid in requested status' do
    post :create, params: { bid: {
      user_id: @user.id , 
      project_id: @project.id 
    }
    }
    expect(response).to have_http_status 302
  end
  context 'user requests for same project twice' do
    it 'rescues the exception' do
      post :create, params: { bid: {
        user_id: @user.id , 
        project_id: @project.id 
      }
      }
      post :create, params: { bid: {
        user_id: @user.id , 
        project_id: @project.id 
      }
      }
      expect(response).to have_http_status 302
      expect(response).to redirect_to(projects_path)
      expect(flash[:alert]).to match(/^You have already requested/)
    end
  end
end
