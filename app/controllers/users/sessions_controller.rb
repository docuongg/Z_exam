# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  def show
    @user = current_user
    sql = "select * from tags where id in (select id from user_tags where user_id = #{@user.id})"
    @tags = Tag.find_by_sql(sql)

    #exams_passed
    sql2 = "select * from exam_passeds where user_id = #{@user.id}"
    @exams_passed = ExamPassed.find_by_sql(sql2)

    #average_score
    @avg_score = ExamPassed.where("user_id = #{current_user.id}").average(:score).round
    
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
