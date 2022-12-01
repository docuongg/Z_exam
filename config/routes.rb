Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  devise_scope :user do  
    get '/users/profile' => 'users/sessions#show', :as => 'profile'    
  end

  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

end
