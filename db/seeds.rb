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
    work: 0,
    client_info: "test_info#{n + 1}",
    password: "aaa111#{n + 1}",
    telephone_number: "0900000123#{n + 1}",
    is_deleted: false,
  )
end
Client.create!(
    email: "client99@test.com",
    name: "テスト太郎99",
    work: 1,
    client_info: "test_info99",
    password: "aaa11199",
    telephone_number: "09000001239",
    is_deleted: true,
  )

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
      },
      {
        genre_id: 1,
        email: "trader5@test.com",
        name: "悪徳材料店",
        trader_info: "退会済みの店",
        password: "aaa1115",
        telephone_number: "01944001234",
        is_deleted: true,
      }
    ]
  )

Admin.create!(
   email: 'about@test.com',
   password: 'aboutadmin',
   name: 'admin1'
)
5.times do |n|
  Post.create!(
    trader_id: 1,
    title: "テスト投稿#{n + 1}",
    body: "テスト内容#{n + 1}",
  )
end
5.times do |n|
  Post.create!(
    trader_id: 2,
    title: "テスト投稿#{n + 1}",
    body: "テスト内容#{n + 1}",
  )
end
5.times do |n|
  Post.create!(
    trader_id: 3,
    title: "テスト投稿#{n + 1}",
    body: "テスト内容#{n + 1}",
  )
end
5.times do |n|
  Post.create!(
    trader_id: 4,
    title: "テスト投稿#{n + 1}",
    body: "テスト内容#{n + 1}",
  )
end
5.times do |n|
  Post.create!(
    trader_id: 5,
    title: "退会済み会員の投稿#{n + 1}",
    body: "テスト内容#{n + 1}",
  )
end

6.times do |n|
  Comment.create!(
    client_id: 1,
    post_id: "#{n + 1}",
    comment: "顧客１テストコメント#{n + 1}",
  )
end
6.times do |n|
  Comment.create!(
    client_id: 3,
    post_id: "#{n + 1}",
    comment: "顧客３テストコメント#{n + 1}",
  )
end
6.times do |n|
  Comment.create!(
    client_id: 4,
    post_id: "#{n + 1}",
    comment: "顧客４テストコメント#{n + 1}",
  )
end
6.times do |n|
  Comment.create!(
    client_id: 7,
    post_id: "#{n + 1}",
    comment: "退会済み会員のコメント#{n + 1}",
  )
end
