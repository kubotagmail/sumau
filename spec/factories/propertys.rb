# 参考記事
# https://qiita.com/tofuonfire/items/2ee10bed7a4be3d142fb
# https://qiita.com/Hyuga-Tsukui/items/57fa77df2b2942414307
# https://study-diary.hatenadiary.jp/entry/2020/09/23/212400
# https://qiita.com/komaitaira/items/37f464c17f7cdc61d292
FactoryBot.define do
  factory :property do
    customer_id {1}
    property_type_id {1}
    floor_plan_id {1}
    location { Faker::Lorem.characters(number:20) }
    description { Faker::Lorem.characters(number:50) }
    price { Faker::Number.number(digits: 4) }
    sales_status {0}
    star {0}
    latitude {35.6890329}
    longitude {139.7121998}
    name { Faker::Lorem.characters(number:8) }
    customer
  end
end