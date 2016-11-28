FactoryGirl.define do
  factory :intake do
    start_date "#{2.days.ago}"
    last_date "#{3.days.from_now}"
  end
end
