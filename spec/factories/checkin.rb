FactoryGirl.define do

  factory :checkin do

    association :student
    association :day
    status "pending"
  end


end
