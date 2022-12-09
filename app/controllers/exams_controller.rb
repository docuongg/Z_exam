class ExamsController < ApplicationController
    def show
        @exam = Exam.find(params[:id])
    end

    # def do
    #     @exam = Exam.get_info_exam(params[:id])
    #     @questions = Question.get_questions_exam(params[:id])
    # end

    # def mark

  
    #     new_exam_passed = ExamPassed.new("name": @exam.name, "exam_id": @exam.id, "user_id": current_user.id)
    #     new_exam_passed.save()
    # end

    # def result
    #     @exam = Exam.get_info_exam(params[:id])
    #     @questions = Question.get_questions_exam(params[:id])


    # end
end
