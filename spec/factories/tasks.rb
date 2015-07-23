FactoryGirl.define do
  factory :task do
    sequence(:id) { |n| 10000+n}
    sequence(:title) { |n| "Task number #{n}" }
    status 1
    board nil
  end
end
