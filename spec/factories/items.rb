FactoryBot.define do
  factory :item do
    title       { Faker::Lorem.sentence }
    text        { Faker::Lorem.sentences }
    genre_id    { Faker::Number.between(from: 1, to: 10) }
    status_id   { Faker::Number.between(from: 1, to: 6) }
    bear_id     { Faker::Number.between(from: 1, to: 2) }
    from_id     { Faker::Number.between(from: 1, to: 47) }
    day_id      { Faker::Number.between(from: 1, to: 3) }
    price       { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
