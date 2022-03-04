# frozen_string_literal: true

class Ingredient < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_ingredient,
                  associated_against: { recipe: [:title, :category] },
                  against: { name: 'A' },
                    using: {
                      tsearch: {
                        dictionary: 'english', tsvector_column: 'searchable'
                      }
                    }

  belongs_to :recipe
end
