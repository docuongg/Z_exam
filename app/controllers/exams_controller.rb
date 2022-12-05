class ExamsController < ApplicationController
    def detail
        @detail_exam = Exam.get_info_exam(params[:id])
    end

    def do
        @exam = Exam.get_info_exam(params[:id])
        @questions = Question.get_questions_exam(params[:id])
    end

    def mark

    end
end
