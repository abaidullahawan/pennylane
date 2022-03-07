# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  def index
    if search_params['search'].blank?
      @q = Recipe.all
    else
      @q = Recipe.search_recipe_ingredient(search_params['search'])
    end
    @pagy, @recipes = pagy(@q, items: 30)
  end

  def show
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def split_search_params(search_params)
      ingredient_search = search_params['search']&.split(' ')
      ingredient_search&.select { |t| t.size >= 3 }
    end

    def search_params
      params.permit(:search)
    end
end
