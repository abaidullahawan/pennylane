# frozen_string_literal: true

class RecipesController < ApplicationController
  def search_recipe
    ingredient_search = search_params['search']&.gsub(',', ' ')&.split(' ')
    @q = Ingredient.joins(:recipe).includes(:recipe)
      .ransack(name_cont_any: ingredient_search, title_cont_any: ingredient_search)
    @ingredients = search_params.present? ? @q.result.uniq(&:name) : Ingredient.all

    @ingredients = @ingredients.paginate page: params[:page]
  end

  private
    def search_params
      params.permit(:search)
    end
end
