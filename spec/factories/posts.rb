FactoryBot.define do
  factory :post do
    content { "MyText" }
    user { nil }
    community { nil }
  end
end
