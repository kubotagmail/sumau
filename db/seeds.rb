# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: 'admin@admin'
)


FloorPlan.create!(
  name: "その他"
  )
FloorPlan.create!(
  name: "ワンルーム(1R)"
  )
FloorPlan.create!(
  name: "1K"
  )
FloorPlan.create!(
  name: "1DK"
  )
FloorPlan.create!(
  name: "1LDK"
  )
FloorPlan.create!(
  name: "1SLDK"
  )
FloorPlan.create!(
  name: "2K"
  )
FloorPlan.create!(
  name: "2DK"
  )
FloorPlan.create!(
  name: "2LDK"
  )
FloorPlan.create!(
  name: "2SLDK"
  )
FloorPlan.create!(
  name: "3DK"
  )
FloorPlan.create!(
  name: "3LDK"
  )
FloorPlan.create!(
  name: "3SLDK"
  )
FloorPlan.create!(
  name: "4DK"
  )
FloorPlan.create!(
  name: "4LDK"
  )
FloorPlan.create!(
  name: "4SLDK"
  )


PropertyType.create!(
   name: "その他"
   )
PropertyType.create!(
   name: "新築一戸建て"
   )
PropertyType.create!(
   name: "中古一戸建て"
   )
PropertyType.create!(
   name: "新築マンション"
   )
PropertyType.create!(
   name: "中古マンション"
   )



 Customer.create!(
  email: "admin@admin",
  password: "admin@admin",
  last_name: "山田",
  first_name: "花子",
  last_name_kana: "ヤマダ",
  first_name_kana: "ハナコ",
  postal_code: "1040041",
  address: "東京都中央区新富2丁目",
  telephone_number: "09012345678",
  is_deleted: false
)





