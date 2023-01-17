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
    permitted = [:name, :description, :timeout, :thumbnail_url, :image, :tag_id]
    permitted << :other if params[:action] == 'create'
    permitted
  end
  
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :timeout
    column :created_at
    column :update_at
    actions
  end

  controller do
    def new
      @exam = Exam.new()
      @tags = Tag.all
      render 'admin/exams/new', :layout =>"active_admin"
    end

    def create
      @exam = Exam.create!(exam_params)

      if @exam.save
        redirect_to admin_exams_path
      else
        render :new
      end
    end

    def edit
      @exam = Exam.find(params[:id])
      @tags = Tag.all
      render 'admin/exams/edit', :layout =>"active_admin"
    end

    def update
      @exam = Exam.find(params[:id])

      if @exam.update!(exam_params_update)
        redirect_to admin_exams_path
      else
        render :edit
      end
    end

    def show
      @exam = Exam.find(params[:id])
      render 'admin/exams/show', :layout =>"active_admin"
    end
    private

    def exam_params
      params.require(:exam).permit(:name, :description, :tag_id, :timeout, :image, questions_attributes: [:id, :title, options_attributes: [:id, :title, :is_correct]])
    end

    def exam_params_update
      params[:exam][:questions_attributes].values.map do |question_value|
        question_value[:options_attributes]&.values&.map do |option_value|
          if option_value[:is_correct].blank?
            option_value[:is_correct] = false
          end
        end
      end
      params.require(:exam).permit(:id, :name, :description, :tag_id, :timeout, :image, questions_attributes: [:id, :title, :_destroy, options_attributes: [:id, :title, :is_correct, :_destroy]])
    end
  end
end
