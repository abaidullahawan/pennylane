# frozen_string_literal: true

class Recipe < ActiveRecord::Base
  include PgSearch::Model
  has_many :ingredients, dependent: :destroy


  pg_search_scope :search_recipe_ingredient, 
  associated_against: { ingredients: [:name] },
  against: :title, 
  using: {
    tsearch: {dictionary: "english", any_word: true}
  }

end
