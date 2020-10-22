FactoryBot.define do
  factory :user do
    nickname       { Faker::Name.name }
    email          { Faker::Internet.free_email }
    password       { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    full_name      { ForgeryJa(:name).full_name }
    full_name_kana { "ヤマダタロウ" }
    birth_day      { Faker::Date.birthday(min_age: 18, max_age: 65) }
    sex            { "男" }
    phone          { Faker::Number.number(digits: Faker::Number.between(from: 10, to: 11)) }
    team_id        { 2 }
  end
end
