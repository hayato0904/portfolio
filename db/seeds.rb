name = 'admin'
  email = 'admin@example.com'
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    admin: true
  )

4.times do |n|
  name = Faker::Games::Pokemon.name
  email = "test#{n + 1}@example.com"
  password = "password#{n + 1}"
  User.create!(name: name,
    email: email,
    password: password
  )
end

  Topick.create!(
    content: "最近太ったわ",
    user_id:1
  )

  Topick.create!(
    content: "ラーメン食べたい",
    user_id:2
  )

  Topick.create!(
    content: "腹筋バキバキにしたい",
    user_id:3
  )

  Topick.create!(
    content: "東大行きたい",
    user_id:4
  )

  Topick.create!(
    content: "味噌煮込みうどんゆうてたべたことない",
    user_id:5
  )

  Favorite.create!(
    user_id:1,
    topick_id:2
  )

  Favorite.create!(
    user_id:2,
    topick_id:1
  )

  Favorite.create!(
    user_id:3,
    topick_id:1
  )

  Favorite.create!(
    user_id:4,
    topick_id:1
  )

  Favorite.create!(
    user_id:5,
    topick_id:1
  )

  Comment.create!(
    topick_id:5,
    content:"かぜの時に食べるといいよね"
  )

  Comment.create!(
    topick_id:4,
    content:"俺東大"
  )

  Comment.create!(
    topick_id:3,
    content:"腹筋ローラーおすすめだよ"
  )

  Comment.create!(
    topick_id:2,
    content:"今日納豆辛子みそラーメンおすすめだよ"
  )

  Comment.create!(
    topick_id:1,
    content:"カロリー計算大事！！"
  )