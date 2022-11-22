# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_221_121_102_939) do
  create_table 'answers', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'option_id', null: false
    t.integer 'question_id', null: false
    t.integer 'exam_passed_id', null: false
    t.index ['exam_passed_id'], name: 'index_answers_on_exam_passed_id'
    t.index ['option_id'], name: 'index_answers_on_option_id'
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'exam_passeds', force: :cascade do |t|
    t.string 'name'
    t.integer 'numberOfQuestion'
    t.integer 'score'
    t.datetime 'finishAt'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'exam_id', null: false
    t.integer 'user_id', null: false
    t.index ['exam_id'], name: 'index_exam_passeds_on_exam_id'
    t.index ['user_id'], name: 'index_exam_passeds_on_user_id'
  end

  create_table 'exams', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.integer 'timeout'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'tag_id', null: false
    t.index ['tag_id'], name: 'index_exams_on_tag_id'
  end

  create_table 'options', force: :cascade do |t|
    t.string 'title'
    t.boolean 'isCorrect'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'question_id', null: false
    t.index ['question_id'], name: 'index_options_on_question_id'
  end

  create_table 'questions', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'exam_id', null: false
    t.index ['exam_id'], name: 'index_questions_on_exam_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'user_tags', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id', null: false
    t.integer 'tag_id', null: false
    t.index ['tag_id'], name: 'index_user_tags_on_tag_id'
    t.index ['user_id'], name: 'index_user_tags_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'password_digest'
    t.boolean 'admin'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  create_table 'votes', force: :cascade do |t|
    t.float 'rate'
    t.string 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'exam_id', null: false
    t.index ['exam_id'], name: 'index_votes_on_exam_id'
  end

  add_foreign_key 'answers', 'exam_passeds'
  add_foreign_key 'answers', 'options'
  add_foreign_key 'answers', 'questions'
  add_foreign_key 'exam_passeds', 'exams'
  add_foreign_key 'exam_passeds', 'users'
  add_foreign_key 'exams', 'tags'
  add_foreign_key 'options', 'questions'
  add_foreign_key 'questions', 'exams'
  add_foreign_key 'user_tags', 'tags'
  add_foreign_key 'user_tags', 'users'
  add_foreign_key 'votes', 'exams'
end
