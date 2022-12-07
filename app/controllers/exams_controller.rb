class ExamsController < ApplicationController
    def detail
        @detail_exam = Exam.get_info_exam(params[:id])
    end

    def do
        @exam = Exam.get_info_exam(params[:id])
        @questions = Question.get_questions_exam(params[:id])
    end

    def mark
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
