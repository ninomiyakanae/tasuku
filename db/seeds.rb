# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
99.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

@users = User.order(:created_at).take(3)
50.times do |n|
  task_name = "タスク#{n + 1}" 
  task_description = "タスク詳細#{n + 1}"
  @users.each { |user| user.tasks.create!(name: task_name, description: task_description) }
end

