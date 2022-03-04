# frozen_string_literal: true

class RecipesController < ApplicationController
  def search_recipe
    ingredient_search = split_search_params(search_params)
    @q = ingredient_search.blank? ? Ingredient.ransack(params[:q]) :
      Ingredient.search_ingredient(search_params['search']).ransack(params[:q])
    @pagy, @ingredients = pagy(@q.result.includes(:recipe), items: 12)
  end

  def show_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  private
    def split_search_params(search_params)
      ingredient_search = search_params['search']&.split(' ')
      ingredient_search&.select { |t| t.size >= 3 }
    end

    def search_params
      params.permit(:search)
    end
end
