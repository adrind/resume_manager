FactoryGirl.define do
  factory :job do
    start_date '2017-02-01'
    end_date '2017-10-31'
    employer 'Code for America'
    position 'Engineer'
    location 'San Francisco'
    description 'Saving the world one rails app at a time'
    reason 'Fellowship'

    association :user
  end
end
