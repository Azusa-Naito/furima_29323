FactoryBot.define do
  factory :order_address do
    token           { Faker::Lorem.sentence }
    postal_code     { "123-1234" }
    from_id         { Faker::Number.between(from: 1, to: 47) }
    city            { Gimei.city.kanji }
    block_number    { Gimei.city.kanji }
    apartment_name  { Gimei.town.kanji }
    phone_number    { "09012345678" }
    association :user
    association :item
  end
end