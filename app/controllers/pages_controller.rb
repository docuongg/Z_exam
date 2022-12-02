class PagesController < ApplicationController
  def home
    # New exams
    @new_exams = Exam.new_exams

    
    # binding.pry
    if user_signed_in?
      @user = current_user
      sql1 = "select * from exam_passeds left join exams on exam_passeds.exam_id = exams.id where exam_passeds.user_id = #{@user.id}"
      @completed_exams = ExamPassed.find_by_sql(sql1)
      
      sql2 = "select * from exams where tag_id in (select id from user_tags where user_id = #{@user.id})"
      @suggestion_exams = Exam.find_by_sql(sql2)
    end 

    sql = "select * from exams join votes on exams.id = votes.exam_id group by exams.id order by count(exams.id) limit 5"
    @popular_exams = Exam.find_by_sql(sql)
    

    
  end
end