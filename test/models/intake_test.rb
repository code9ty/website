require 'test_helper'

class IntakeTest < ActiveSupport::TestCase
  test "intake open" do
    assert Intake.open?
  end
  test 'intake is closed' do
    intake = Intake.last
    intake.update_attributes(last_date: 1.day.ago)
    refute Intake.open?
  end
end
