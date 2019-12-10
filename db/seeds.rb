#ユーザー
30.times do |n|
  name  = "User#{n+1}"
  email = "example-#{n+1}@careerWalk.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password)
end

#イベント
30.times do |n|
  title = "Event#{n+1}"
  location = "Osaka#{n+1}"
  started_at = Time.now
  Event.create(title: title,
               location: location,
               started_at: started_at)
end
