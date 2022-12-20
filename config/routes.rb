Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  devise_scope :user do  
    get '/users/profile' => 'users/sessions#show', :as => 'profile'    
  end

  resources :exams do
    resources :exam_passeds do
      resources :votes 
    end
  end
end
