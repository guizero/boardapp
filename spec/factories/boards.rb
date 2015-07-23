FactoryGirl.define do
  factory :board do
    title "My board"
    association :user, factory: :user
    private true
  end
end
