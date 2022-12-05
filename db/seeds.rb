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
        avatar_url: Faker::Avatar.image
# a user can have only one of these roles
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
        exam_id: rand(1..30)
    )
end

    # Completed exams
    # sql1 = "select * from exam_passeds
    # where user_id = #{@user.id}"
    # @completed_exams = ExamPassed.find_by_sql(sql1)

(1..200).each do |id|
    Question.create!(
        title: Faker::Lorem.question(word_count: 6),
        exam_id: rand(1..30)
    )
end

(1..1000).each do |id|
    Option.create!(
        title: Faker::Lorem.paragraph(sentence_count: 2),
        isCorrect: [true, false].sample,
        question_id: rand(1..200)
    )
end

(1..2000).each do |id|
    Answer.create!(
        option_id: rand(1...1000),
        question_id: rand(1..200),
        exam_passed_id: rand(1..40)
    )
end