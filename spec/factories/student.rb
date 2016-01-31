FactoryGirl.define do
  sequence(:email) { |n| "person#{n}@example.com" }


  factory :student do
    name "Jane Doe"
    password "sekret"
    email

    association :cohort
  end


end
