class PagesController < ApplicationController
  def home
    @new_exams = Exam.new_exams

    if user_signed_in?
      @completed_exams = Exam.completed_exams(@current_user.id).paginate(page: params[:page], per_page: 9)
      
      @suggestion_exams = Exam.suggestion_exams(@current_user.id).paginate(page: params[:page], per_page: 9)
    end 

    @popular_exams = Exam.popular_exams
    @count_passed_exams_of_popular_exams = Exam.passed_exams_count
  end
end