# coding: utf-8

User.create!(name: "管理者",
             email: "sample3762@email.com",
             password: "password",
             password_confirmation: "password",
             department: "本社",
             employee_number: 3762,
             uid: 762,
             admin: true)
             
 User.create!(name:  "上長A",
             email: "sample2597@email.com",
             password:              "password",
             password_confirmation: "password",
             department: "本社",
             employee_number: 2597,
             uid: 597,
             superior: true)

  User.create!(name:  "上長B",
             email: "sample3470@email.com",
             password:              "password",
             password_confirmation: "password",
             department: "本社",
             employee_number: 3470,
             uid: 470,
             superior: true)     
             

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               department: "本社",
               employee_number: n+1,
               uid: n+1,
               password: password,
               password_confirmation: password)
end