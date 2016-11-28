When(/^I am an interested user$/) do
end

Given(/^the application is open$/) do
 FactoryGirl.create(:intake)
end


When(/^I visit application page$/) do
  visit apply_path
end

When(/^I fill in the required fields$/) do
  fill_in 'First name', with: 'Name1'
  fill_in 'Last name', with: 'LastName'
  fill_in 'Mobile number', with: '0711123456'
  fill_in 'Email', with: 'me@email.com'
  fill_in 'Github', with: 'https://github.com/me'
  click_button 'Apply'
end

When(/^I fill in the wrong information$/) do
  fill_in 'First name', with: 'Name1'
  fill_in 'Last name', with: 'LastName'
  fill_in 'Mobile number', with: ''
  fill_in 'Email', with: 'me@email.com'
  fill_in 'Github', with: 'https://github.com/me'
  click_button 'Apply'
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content arg1
end

