require "test_helper"

class VisitorApplicationTest < Capybara::Rails::TestCase
  feature 'visitors can sign up' do
    it "when applications are closed" do
      intake = intakes(:open)
      intake.update_attributes(last_date: 1.day.ago)
      visit root_url
      assert_content page, "#code9ty"
      refute_content page, "Apply"
    end
    it 'applying when applications open' do
      visit root_url
      assert_content page, "Apply"
      visit apply_path
      fill_in 'First name', with: 'myName'
      fill_in 'Last name', with: 'myLast'
      fill_in 'Email', with: 'me@example.com'
      fill_in 'Mobile number', with: '1234567890'
      fill_in 'Github', with: 'https://github.com/me'
      click_button  'Apply'
      assert_equal 1, ActionMailer::Base.deliveries.size
    end
  end
end
