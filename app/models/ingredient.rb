# frozen_string_literal: true

class Ingredient < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_ingredient, against: :name, associated_against: { recipe: [:title, :category] }
  belongs_to :recipe
end
