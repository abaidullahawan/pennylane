Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "recipes#search_recipe"
  get '/show_ingredient/:id', to: "recipes#show_ingredient", as: :show_ingredient
  get '/search_recipe', to: "recipes#search_recipe", as: :search_recipe
end
