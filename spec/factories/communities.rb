FactoryBot.define do
  factory :community do
    name { "MyString" }
    description { "MyText" }
    theme { association(:theme) }
  end
end
