# frozen_string_literal: true

require 'will_paginate/array'

class RecipesController < ApplicationController
  def search_recipe
    ingredient_search = search_params['search']
    @ingredients = ingredient_search.present? ?
      Ingredient.search_ingredient(search_params['search']).first(35) : Ingredient.first(1000)
    @ingredients = @ingredients.paginate page: params[:page]
  end

  private
    def search_params
      params.permit(:search)
    end
end
