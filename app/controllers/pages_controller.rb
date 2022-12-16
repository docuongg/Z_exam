class PagesController < ApplicationController
  def home
    @tags = Tag.all
    if !search_params.blank?
      @prev_search_tag = params[:tag]
      @prev_search_key = params[:key]
      if params[:tag] == "All"
        @exams = Exam.find_by_name(params[:key]).paginate(page: params[:page], per_page: 9)   
      else
        @exams = Exam.search(search_params).paginate(page: params[:page], per_page: 9)   
      end
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
    params.permit([:key, :tag])
  end
end