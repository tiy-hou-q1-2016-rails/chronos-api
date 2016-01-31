FactoryGirl.define do

  factory :day do
    association :cohort
    start_time 14.minutes.ago
  end

end
