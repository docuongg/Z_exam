class ExamPassed < ApplicationRecord
    belongs_to :user
    belongs_to :exam

    has_many :questions, through: :exam
    has_many :answers
    
    accepts_nested_attributes_for :answers

    scope :number_of_passed_exams, ->  {count}
    scope :avg_score_of_passed_exams, -> {average(:score).round}

    private

    def set_score
        @exam = Exam.get_info_exam(params[:id])
        @correct_option = Option.get_correct_option(params[:id])
        @correct_option_array = @correct_option.map do |o|
            o.id
        end
        @questions = Question.get_questions_exam(params[:id])
        @user_option_array = @questions.map do |q|
            params["#{q.id}"]
        end
        @user_option_array = @user_option_array.reject(&:nil?).map(&:to_i)

        @correct_option_user = @user_option_array & @correct_option_array
    end

end