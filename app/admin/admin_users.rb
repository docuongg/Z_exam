ActiveAdmin.register AdminUser do
  permit_params do
    permitted = [:user_name, :email, :password, :password_conformation, :encrypted_password, :permission, :reset_password_token, :reset_password_sent_at, :remember_created_at]
    permitted << :other if params[:action] == 'create' 
    # permitted
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
