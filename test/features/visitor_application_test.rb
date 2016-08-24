require "test_helper"

class VisitorApplicationTest < Capybara::Rails::TestCase
  feature 'visitors can sign up' do
    scenario  "when applications are closed" do
      intake = intakes(:open)
      intake.update_attributes(last_date: 1.day.ago)
      visit root_url
      assert_content page, "#code9ty"
      refute_content page, "Apply"
      assert_content page, "December"
    end
    scenario 'applying when applications open' do
      intake = intakes(:open)
      visit root_url
      refute_content page, intake.last_date.strftime("%A, %b")
      assert_content page, "Apply"
      visit apply_path
      fill_in 'First name', with: 'myName'
      fill_in 'Last name', with: 'myLast'
      fill_in 'Email', with: 'me@example.com'
      fill_in 'Mobile number', with: '1234567890'
      fill_in 'Github', with: 'https://github.com/me'
      click_button  'Apply'
      # assert_equal 1, ActionMailer::Base.deliveries.size
    end
    scenario 'when application date is in future' do
      intake = intakes(:open)
      intake.update_attributes(start_date: 2.days.from_now, last_date: 5.days.from_now)
      visit root_url
      assert_content page, intake.start_date.strftime("%A, %b")
    end
  end
end
