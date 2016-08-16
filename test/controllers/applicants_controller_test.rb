require 'test_helper'

class ApplicantsControllerTest < ActionDispatch::IntegrationTest
  test 'POST #create' do
    #with valid params
    assert_difference 'Applicant.count', 1 do
      post apply_path params: {
        applicant: {
          first_name: "Antony",
          last_name: "Bond",
          email: "eintein@gmail.com",
          mobile_number: "0158752912",
          github: "http://github.com/r9fwbsjk"
        }
    }
    end

    #with invalid parameters
    assert_no_difference 'Applicant.count' do
      post apply_path params: {
        applicant: {
          first_name: "",
          last_name: "t",
          email: "gmail.com",
          mobile_number: "",
          github: ""
        }
      }
    end
  end

  test 'cannot apply if application is closed' do
    intake = intakes(:open)
    intake.update_attributes(last_date: 1.day.ago)
    get apply_path
    assert_redirected_to root_url
    assert_not flash.empty?
  end

end
