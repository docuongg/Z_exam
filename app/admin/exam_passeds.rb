ActiveAdmin.register ExamPassed do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :number_of_question, :score, :finish_at, :exam_id, :user_id
  #
  # or
  #
  permit_params do
    permitted = [:name, :number_of_question, :score, :finish_at, :exam_id, :user_id]
    permitted << :other if params[:action] == 'create' 
    permitted
  end
  
  belongs_to :user

  # controller do
  #   def show
  #     @exam_passed = ExamPassed.find(params[:id])
  #     render 'admin/exam_passeds/show', :layout =>"active_admin"
  #   end
  # end

end
