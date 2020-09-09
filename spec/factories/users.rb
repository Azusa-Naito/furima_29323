FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    last_name             {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    last_name_k           {Gimei.last.katakana}
    first_name_k          {Gimei.first.katakana}
    birthday              {Faker::Date.birthday(min_age: 12, max_age: 100)}
  end
end
