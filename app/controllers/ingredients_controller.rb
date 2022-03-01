class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.paginate :page => params[:page]
  end

  def search_recipe
    ingredient_search = params[:search].split(",")
    ingredient_search = ingredient_search.map{|t| "%#{t}%"}
    @ingredients = Ingredient.where("name ILIKE ANY ( array[?] )", ingredient_search)
    @ingredients = @ingredients.joins(:recipe).includes(:recipe).paginate :page => params[:page]
  end
end
