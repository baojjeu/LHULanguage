Rails.application.routes.draw do

  root               'demands#index'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users do
     resource :profile
    resources :demands, only: :index
    resources :notifications, only: [:index, :create]
  end

  resources :demands do
    member do
        get :apply_form
        get :determine
       post :apply
       post :cancel_apply
      patch :allow
    end
  end
end
