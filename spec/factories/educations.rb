FactoryGirl.define do
  factory :education do
    name "My school"
    id ""
    year 2013
    level "College"

    association :user
  end
end
