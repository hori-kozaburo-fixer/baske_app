FactoryBot.define do
  factory :tweet do
    name    { Faker::Lorem.sentence } 
    text    { Faker::Lorem.sentences }
    team_id { 2 }
    association :user
  end
end
