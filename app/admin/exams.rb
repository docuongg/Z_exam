ActiveAdmin.register Exam do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :timeout, :thumbnail_url, :tag_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :timeout, :thumbnail_url, :tag_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params do
    permitted = [:name, :description, :timeout, :thumbnail_url, :tag_id]
    permitted << :other if params[:action] == 'create'
    permitted
  end
  
  controller do
    def new
      @exam = Exam.new()
      @tags = Tag.all
      render 'admin/exams/new', :layout =>"active_admin"
    end

    def create
      @exam = Exam.new(exam_params)
      binding.pry
      if @exam.save
        redirect_to admin_exams_path
      else
        render :new
      end
    end

    private

    def exam_params
      params.require(:exam).permit(:name, :description, :tag_id, :timeout, questions_attributes: [:title, options_attributes: [:title, :isCorrect]])
    end
  end
end
