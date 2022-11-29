# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# generate 20 users
(1..20).each do |id|
    User.create!(
# each user is assigned an id from 1-20
        full_name: Faker::Name.name,
        username: Faker::Internet.email.split('@')[0],
        email: Faker::Internet.email,
# issue each user the same password
        password: "Cuongptit1.", 
        password_confirmation: "Cuongptit1.",
# a user can have only one of these roles
    )
end

(1..10).each do |id|
    Tag.create!(
        name: Faker::ProgrammingLanguage.name
    )
end

(1..30).each do |id|
    Exam.create!(
        name: Faker::Movie.title,
        description: Faker::Movie.quote,
        timeout: id*10,
        tag_id: rand(0..9)
    )
end

(1..40).each do |id|
    UserTag.create!(
        user_id: rand(0..19),
        tag_id: rand(0..9)
    )
end

(1..40).each do |id|
    ExamPassed.create!(
        user_id: rand(0..19),
        exam_id: rand(0..29),
        score: rand(50..100),
        name: Exam.find(exam_id).name
    )
end

