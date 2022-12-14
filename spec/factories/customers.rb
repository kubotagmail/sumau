# Fakerのドキュメント↓
# https://github.com/faker-ruby/faker/blob/main/doc/default/number.md
FactoryBot.define do
  factory :customer do
    last_name { Faker::Lorem.characters(number:5) }
    first_name { Faker::Lorem.characters(number:5) }
    last_name_kana { Faker::Lorem.characters(number:5) }
    first_name_kana { Faker::Lorem.characters(number:5) }
    postal_code { Faker::Number.number(digits: 7) }
    address { Faker::Lorem.characters(number:20) }
    telephone_number { Faker::Lorem.characters(number:12) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end