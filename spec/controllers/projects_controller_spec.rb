require 'rails_helper' 
RSpec.describe ProjectsController, type: :controller do
  describe 'Get new' do
    get :new
    expect(response).to be 200
  end
  describe 'POST to create new project' do
    
  end
end
