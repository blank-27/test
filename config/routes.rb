Rails.application.routes.draw do
  root  'home#index'
  get   'edit'    => 'home#edit'
  get   'login'   => 'sessions#new'
  post  'login'   => 'sessions#create'
  get  'signup'  => 'signup#create'
  post  'signup'  => 'signup#new'
  delete 'logout'  => 'sessions#destroy'

  resources :profiles , only: [:index, :update] do
    collection do
      get 'public/:id', to: 'profiles#share', as: 'public'
    end
  end

  resources :educations , only: [:new]
  resources :experiences , only: [:new, :update]
  resources :projects , only: [:new , :update]
end 

