FactoryBot.define do
  factory :vote do
    association :option, factory: :option    
  end
end
