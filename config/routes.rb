Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "ingredients#index"
  resources :ingredients
  resources :recipes
  get '/search_recipe', to: "ingredients#search_recipe", as: :search_recipe
end
