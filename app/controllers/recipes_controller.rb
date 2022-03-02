# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.paginate page: params[:page]
  end
end
