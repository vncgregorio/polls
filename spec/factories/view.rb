FactoryBot.define do
  factory :view do
    association :poll, factory: :poll
  end
end
