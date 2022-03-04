# frozen_string_literal: true

class RecipesController < ApplicationController
  def search_recipe
    ingredient_search = search_params['search']
    @q = ingredient_search.present? ?
      Ingredient.search_ingredient(search_params['search']).ransack(params[:q]) : Ingredient.ransack(params[:q])
    @pagy, @ingredients = pagy(@q.result, items: 12)
  end

  private
    def search_params
      params.permit(:search)
    end
end
