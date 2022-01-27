Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home/show'
  # For details on the DSL available within this file, see ht
  # tps://guides.rubyonrails.org/routing.html
  root "recipes#index"
  resources :recipes, param: :recipe_id
end
