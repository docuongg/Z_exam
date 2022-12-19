class PagesController < ApplicationController
  def home
    @new_exams = Exam.new_exams.limit(5)

    if user_signed_in?
      @completed_exams = current_user.exam_passeds.best_completed_exams.paginate(page: params[:page], per_page: 9)
      @tag_ids = current_user.tag_ids
      @suggestion_exams = Exam.by_id(@tag_ids).paginate(page: params[:page], per_page: 9)
    end 

    @popular_exams = Exam.popular_exams.limit(5)
    @count_passed_exams_of_popular_exams = Exam.passed_exams_count
  end
end