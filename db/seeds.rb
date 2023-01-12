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
        full_name: Faker::Name.name,
        username: Faker::Internet.email.split('@')[0],
        email: Faker::Internet.email,
        password: "Cuongptit1.", 
        password_confirmation: "Cuongptit1.",
        avatar_url: Faker::Avatar.image
    )
end

(1..10).each do |id|
    Tag.create!(
        name: Faker::ProgrammingLanguage.name
    )
end


(1..40).each do |id|
    UserTag.create!(
        user_id: rand(1..20),
        tag_id: rand(1..10)
    )
end

(1..30).each do |id|
    Exam.create!(
        tag_id: rand(1..10),
        name: Faker::Movie.title,
        description: Faker::Movie.quote,
        thumbnail_url: Faker::Avatar.image,
        timeout: id*10
    )
end

(1..40).each do |id|
    ExamPassed.create!(
        user_id: rand(1..20),
        exam_id: rand(1..30),
        score: rand(50..100)
    )
end

(1..100).each do |id|
    Vote.create!(
        rate: rand(1..10),
        comment: Faker::Movie.quote,
        exam_id: rand(1..30),
        user_id: rand(1..20)
    )
end

(1..200).each do |id|
    Question.create!(
        title: Faker::Lorem.question(word_count: 6),
        exam_id: rand(1..30)
    )
end

(1..200).each do |id|
    a = rand(0..3)
    (0..3).each do |b|
        Option.create!(
            title: Faker::Lorem.paragraph(sentence_count: 2),
            is_correct: a == b ? true : false,
            question_id: id
        )
    end
end

(1..2000).each do |id|
    Answer.create!(
        option_id: rand(1...800),
        question_id: rand(1..200),
        exam_passed_id: rand(1..40)
    )
end

AdminUser.create!(
    user_name: 'admin', 
    email: 'admin@example.com', 
    password: '123456', 
    password_confirmation: '123456', 
    permission: 1) if Rails.env.development?