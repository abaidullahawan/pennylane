# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :recipe

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  def as_indexed_json(options = {})
    self.as_json(
      only: [:id, :name],
      include: {
        recipe: {
          only: [:title, :author]
        }
      }
    )
  end

  def self.search(query1)
    __elasticsearch__.search(
    {
      query: {
         multi_match: {
           query: query1,
           fields: ['name']
         }
       },
    })
  end
end
