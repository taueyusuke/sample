Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations'
  }
  devise_scope :user do
    get 'create' => 'users/registrations#create'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  
  resources :conferencerooms, only: %i(new create index) do
  resources :users, only: %i(new create)
    resources :schedules, only: %i(new create)
  end
  
end
