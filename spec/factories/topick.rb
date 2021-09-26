FactoryBot.define do
  factory :topick do
    content { '味噌汁をのむ' }
    association :user
  end
end

