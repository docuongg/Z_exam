class PagesController < ApplicationController
  def home
    @exam = Exam.ransack()
    @tags = Tag.all
    if search_params.present?
      @prev_search_tag = params[:q][:tag_id_eq]
      @prev_search_key = params[:q][:name_cont]

      @exams = Exam.ransack(params[:q]).result.paginate(page: params[:page], per_page: 9)   
    else
      @new_exams = Exam.new_exams

      if user_signed_in?
        @completed_exams = current_user.exams.completed_exams.paginate(page: params[:page], per_page: 9)        
        @suggestion_exams = current_user.exams.suggestion_exams(@current_user.id).paginate(page: params[:page], per_page: 9)
      end 

      @popular_exams = Exam.popular_exams
      @count_passed_exams_of_popular_exams = Exam.passed_exams_count
    end
  end

  private

  def search_params
    params.permit(q: [:name_cont, :tag_id_eq])
  end
end