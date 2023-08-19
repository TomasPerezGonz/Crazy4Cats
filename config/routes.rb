Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  resources :articles do
    resources :comments, only: [:create]
  end
  post '/new_user_reaction', to: 'reactions#new_user_reaction', as: 'new_user_reaction'
end
