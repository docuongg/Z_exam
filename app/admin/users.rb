ActiveAdmin.register User do

  permit_params do
    permitted = [:full_name, :email, :admin, :password, :password_confirmation, :encrypted_password, :uid, :avatar_url, :provider, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username]
    permitted << :other if params[:action] 
  end

  index do
    selectable_column
    id_column
    column :email
    # column :current_sign_in_at
    # column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def show
      @user = User.find(params[:id])
      @passed_exams = @user.exam_passeds.best_completed_exams
      render 'admin/users/show', :layout =>"active_admin"
    end
  end
end
