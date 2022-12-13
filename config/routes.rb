Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  devise_scope :user do  
    get '/users/profile' => 'users/sessions#show', :as => 'profile'    
  end

  resources :exams do
    resources :exam_passeds 
    resources :votes 
  end
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # get 'exam/:id' => 'exams#detail', :as => 'detail_exam'
  # get 'exam/do/:id' => 'exams#do', :as => 'do_exam'
  # post 'exam/mark/:id' => 'exams#mark', :as => 'mark_exam'

  # get 'exam/result/:id' => 'exams#result', :as => 'result_exam'
end
