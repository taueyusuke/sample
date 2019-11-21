Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :conferencerooms, only: %i(new create) do
    resources :schedules, only: %i(new create)
  end
  
  resources :users, only: %i(new create) do
    resources :schedules, only: %i(new create)
  end
end
