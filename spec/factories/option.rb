FactoryBot.define do
  factory :option do
    association :poll, factory: :poll
    description { "primeira oção" }
  end
end
