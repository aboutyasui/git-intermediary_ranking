# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Genre.create!(
  [
    {
      name: '建築',
    },
    {
      name: '電気',
    },
    {
      name: '空調',
    },
    {
      name: '衛星',
    }
  ]
)

6.times do |n|
  Client.create!(
    email: "client#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}",
    work: "建築関係",
    client_info: "test_info#{n + 1}",
    password: "aaa111#{n + 1}",
    telephone_number: "0900000123#{n + 1}",
    is_deleted: false,
  )
end

  Trader.create!(
    [
      {
        genre_id: 1,
        email: "trader1@test.com",
        name: "テスト材料店1",
        trader_info: "建築資材専門店",
        password: "aaa1111",
        telephone_number: "09000001231",
        is_deleted: false,
      },
      {
        genre_id: 2,
        email: "trader2@test.com",
        name: "テスト材料店2",
        trader_info: "電気工事資材専門店",
        password: "aaa1112",
        telephone_number: "09000001232",
        is_deleted: false,
      },
      {
        genre_id: 3,
        email: "trader3@test.com",
        name: "テスト材料店3",
        trader_info: "空調設備関係の専門店",
        password: "aaa1113",
        telephone_number: "09000001233",
        is_deleted: false,
      },
      {
        genre_id: 4,
        email: "trader4@test.com",
        name: "テスト材料店4",
        trader_info: "衛星設備関係の専門店",
        password: "aaa1114",
        telephone_number: "09000001234",
        is_deleted: false,
      }
    ]
  )

Admin.create!(
   email: 'about@test.com',
   password: 'aboutadmin',
   name: 'admin1'
)

