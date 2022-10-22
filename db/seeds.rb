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
    },
    {
      name: 'その他',
    }
  ]
)

6.times do |n|
  Client.create!(
    email: "client#{n + 1}@test.com",
    name: "一般職#{n + 1}太郎",
    work: 1,
    client_info: "一般人の一般職#{n + 1}太郎です。初心者なので、色々教えてください",
    password: "aaa111#{n + 1}",
    telephone_number: "0900000123#{n + 1}",
    is_deleted: false,
  )
end
6.times do |n|
  Client.create!(
    email: "construction-client#{n + 1}@test.com",
    name: "工事職#{n + 1}太郎",
    work: 0,
    client_info: "工事関係の仕事をしている工事職#{n + 1}太郎です。業者さんに関しては詳しい方なので、しっかりレビューしていきたいです。よろしくお願いします。",
    password: "bbb111#{n + 1}",
    telephone_number: "9090540123#{n + 1}",
    is_deleted: false,
  )
end
Client.create!(
    email: "deleted99@test.com",
    name: "退会済み99太郎",
    work: 1,
    client_info: "荒らし行為で退会済みの退会済み99太郎です",
    password: "aaa11199",
    telephone_number: "09020501239",
    is_deleted: true,
  )
Client.create!(
    email: "deleted98@test.com",
    name: "退会済み98太郎",
    work: 1,
    client_info: "荒らし行為で退会済みの退会済み98太郎です",
    password: "aaa11198",
    telephone_number: "09020501238",
    is_deleted: true,
  )
Client.create!(
    email: "deleted97@test.com",
    name: "退会済み97太郎",
    work: 0,
    client_info: "荒らし行為で退会済みの退会済み97太郎です",
    password: "aaa11197",
    telephone_number: "09020501237",
    is_deleted: true,
  )
  Trader.create!(
    [
      {
        genre_id: 1,
        email: "trader1@test.com",
        name: "老舗材料店1",
        trader_info: "建築資材専門店",
        password: "aaa1111",
        telephone_number: "09000001231",
        is_deleted: false,
      },
      {
        genre_id: 2,
        email: "trader2@test.com",
        name: "優良材料店2",
        trader_info: "電気工事資材専門店",
        password: "aaa1112",
        telephone_number: "09000001232",
        is_deleted: false,
      },
      {
        genre_id: 3,
        email: "trader3@test.com",
        name: "大手材料店3",
        trader_info: "空調設備関係の専門店",
        password: "aaa1113",
        telephone_number: "09000001233",
        is_deleted: false,
      },
      {
        genre_id: 4,
        email: "trader4@test.com",
        name: "一流材料店4",
        trader_info: "衛星設備関係の専門店",
        password: "aaa1114",
        telephone_number: "09000001234",
        is_deleted: false,
      },
      {
        genre_id: 5,
        email: "trader5@test.com",
        name: "大資本材料店5",
        trader_info: "その他関係の専門店",
        password: "aaa1115",
        telephone_number: "09000001235",
        is_deleted: false,
      },
      {
        genre_id: 1,
        email: "deleted_trader1@test.com",
        name: "悪徳材料店１",
        trader_info: "退会済みの店その１",
        password: "bbb1111",
        telephone_number: "01944001231",
        is_deleted: true,
      },
      {
        genre_id: 2,
        email: "deleted_trader2@test.com",
        name: "悪徳材料店２",
        trader_info: "退会済みの店その２",
        password: "bbb1112",
        telephone_number: "01944001232",
        is_deleted: true,
      },
      {
        genre_id: 3,
        email: "deleted_trader3@test.com",
        name: "悪徳材料店３",
        trader_info: "退会済みの店その３",
        password: "bbb1113",
        telephone_number: "01944001233",
        is_deleted: true,
      }
    ]
  )
2.times do |n|
  Trader.create!(
    genre_id: 1,
    email: "trader1#{n + 1}@test.com",
    name: "テスト建築材料#{n + 1}号店",
    trader_info: "建築資材専門#{n + 1}号店",
    password: "ccc111#{n + 1}",
    telephone_number: "0134302123#{n + 1}",
    is_deleted: false,
  )
end
2.times do |n|
  Trader.create!(
    genre_id: 2,
    email: "trader2#{n + 1}@test.com",
    name: "テスト電気材料#{n + 1}号店",
    trader_info: "電気資材専門#{n + 1}号店",
    password: "ddd111#{n + 1}",
    telephone_number: "0134302123#{n + 1}",
    is_deleted: false,
  )
end
2.times do |n|
  Trader.create!(
    genre_id: 3,
    email: "trader3#{n + 1}@test.com",
    name: "テスト空調材料#{n + 1}号店",
    trader_info: "空調資材専門#{n + 1}号店",
    password: "www111#{n + 1}",
    telephone_number: "0134302123#{n + 1}",
    is_deleted: false,
  )
end
2.times do |n|
  Trader.create!(
    genre_id: 4,
    email: "trader4#{n + 1}@test.com",
    name: "テスト衛星材料#{n + 1}号店",
    trader_info: "衛星資材専門#{n + 1}号店",
    password: "qqq111#{n + 1}",
    telephone_number: "0134302123#{n + 1}",
    is_deleted: false,
  )
end
2.times do |n|
  Trader.create!(
    genre_id: 5,
    email: "trader5#{n + 1}@test.com",
    name: "テストその他材料#{n + 1}号店",
    trader_info: "その他資材専門#{n + 1}号店",
    password: "zzz111#{n + 1}",
    telephone_number: "0134302123#{n + 1}",
    is_deleted: false,
  )
end
Admin.create!(
   email: 'about@test.com',
   password: 'aboutadmin',
   name: 'admin1'
)

5.times do |n|
  post = Post.create!(
    trader_id: 1,
    title: "テスト投稿#{n + 1}",
    body: "テスト内容#{n + 1}",
  )
  post.image.attach(io: File.open('app/assets/images/amaebi_computer.jpg'), filename: 'default-image.jpg', content_type: 'image/jpeg')
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
    title: "テスト投稿#{n + 1}",
    body: "テスト内容#{n + 1}",
  )
end
5.times do |n|
  Post.create!(
    trader_id: 6,
    title: "退会済み会員の投稿#{n + 1}",
    body: "テスト内容#{n + 1}",
  )
end
5.times do |n|
  Post.create!(
    trader_id: 7,
    title: "退会済み会員の投稿#{n + 1}",
    body: "テスト内容#{n + 1}",
  )
end
5.times do |n|
  Post.create!(
    trader_id: 8,
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
    client_id: 15,
    post_id: "#{n + 1}",
    comment: "退会済み会員のコメント#{n + 1}",
  )
end

15.times do |n|
  Favorite.create!(
    client_id: 1,
    post_id: "#{n + 1}",
  )
end
20.times do |n|
  Favorite.create!(
    client_id: 5,
    post_id: "#{n + 1}",
  )
end
1.times do |n|
  Favorite.create!(
    client_id: 7,
    post_id: "#{n + 1}",
  )
end
11.times do |n|
  Favorite.create!(
    client_id: 8,
    post_id: "#{n + 1}",
  )
end
26.times do |n|
  Favorite.create!(
    client_id: 12,
    post_id: "#{n + 1}",
  )
end
33.times do |n|
  Favorite.create!(
    client_id: 14,
    post_id: "#{n + 1}",
  )
end

15.times do |n|
  Review.create!(
    client_id: 1,
    trader_id: "#{n + 1}",
    star: 4,
    review_comment: "いい対応だったため。コメントテスト#{n + 1}",
  )
end
10.times do |n|
  Review.create!(
    client_id: 8,
    trader_id: "#{n + 1}",
    star: 3,
    review_comment: "普通の対応しかしてくれないと思ったため。コメントテスト#{n + 1}",
  )
end
13.times do |n|
  Review.create!(
    client_id: 2,
    trader_id: "#{n + 1}",
    star: 5,
    review_comment: "よかったと思ったため。コメントテスト#{n + 1}",
  )
end
13.times do |n|
  Review.create!(
    client_id: 6,
    trader_id: "#{n + 1}",
    star: 3,
    review_comment: "普通。コメントテスト#{n + 1}",
  )
end
14.times do |n|
  Review.create!(
    client_id: "#{n + 1}",
    trader_id: 6,
    star: 1,
    review_comment: "悪徳な業者のため。コメントテスト#{n + 1}",
  )
end
14.times do |n|
  Review.create!(
    client_id: "#{n + 1}",
    trader_id: 7,
    star: 1,
    review_comment: "悪徳な業者のため。コメントテスト#{n + 1}",
  )
end
14.times do |n|
  Review.create!(
    client_id: "#{n + 1}",
    trader_id: 8,
    star: 1,
    review_comment: "悪徳な業者のため。コメントテスト#{n + 1}",
  )
end