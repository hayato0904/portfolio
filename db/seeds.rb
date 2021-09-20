1.times do |n|
  name = Faker::Games::Pokemon.name
  email = "test1@example.com"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
  )
end

1.times do |n|
  name = Faker::Games::Pokemon.name
  email = "test2@example.com"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
  )
end

1.times do |n|
  name = Faker::Games::Pokemon.name
  email = "test3@example.com"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
  )
end

1.times do |n|
  name = Faker::Games::Pokemon.name
  email = "test4@example.com"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
  )
end

1.times do |n|
  name = 'admin'
  email = 'admin@example.com'
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    admin: true
  )
end