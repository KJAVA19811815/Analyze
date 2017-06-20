# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!({
  user_type: "Admin",
  name: "karun",
  email: "k@k",
  password_digest: "karun",
  age: 24,
  sex: "male",
  religion: "agnostic",
  ethnicity:"indian",
  income: 100000

  })
