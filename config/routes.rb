Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails do
    resources :doses, only: %i[new create destroy]
  end

  resources :ingredients, only: %i[new create destroy]
  # A user can see the list of cocktails: GET "cocktails"
  # A user can see the details of a given cocktail, with the dose needed for each ingredient: GET "cocktails/42"
  # A user can create a new cocktail : GET "cocktails/new" | POST "cocktails"

  # A user can add a new dose (ingredient/description pair) to an existing cocktail
  # Checkout simple_form docs about f.association to easily create a select dropdown for our list of ingredients.
  # GET "cocktails/42/doses/new"
  # POST "cocktails/42/doses"
  # A user can delete a dose that belongs to an existing cocktail. How can we make a delete link again?
  # DELETE "doses/25"
  # Do we need an IngredientsController?
end
