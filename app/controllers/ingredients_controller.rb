# frozen_string_literal: true

require 'will_paginate/array'

class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.paginate page: params[:page]
  end

  def search_recipe
    ingredient_search = params[:search]&.split(',')
    ingredient_search = ingredient_search&.map { |t| "%#{t}%" }
    @ingredients = ingredient_search.present? ?
      Ingredient.where('name ILIKE ANY ( array[?] )', ingredient_search) : Ingredient.all

    @ingredients = @ingredients.joins(:recipe).includes(:recipe)
      .uniq(&:name).paginate page: params[:page]
  end
end
