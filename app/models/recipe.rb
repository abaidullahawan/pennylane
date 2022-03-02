# frozen_string_literal: true

class Recipe < ActiveRecord::Base
  has_many :ingredients
end
