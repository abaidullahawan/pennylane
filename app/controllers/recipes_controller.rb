# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  def index
    
    # ingredient_search = split_search_params(search_params)
    # @q = ingredient_search.blank? ? Ingredient.ransack(params[:q]) :
    #   Ingredient.search_ingredient(search_params['search']).ransack(params[:q])
    # @pagy, @ingredients = pagy(@q.result.includes(:recipe), items: 12)
    search_params['search'].blank? ?  @q = Recipe.all : @q = Recipe.search_recipe_ingredient(search_params['search'])
    @pagy, @recipes = pagy(@q, items: 30)
    # @recipes  = @q.result.page(params[:page])
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
