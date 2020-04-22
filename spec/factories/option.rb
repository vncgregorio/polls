FactoryBot.define do
  factory :option do
    association :poll, factory: :poll
    number {1}
    description { "primeira oção" }
  end
end
