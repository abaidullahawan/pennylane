# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

raw_data = File.read('recipes-english.json')
parse_data = JSON.parse(raw_data)

recipes = []
parse_data.each do |data|
  recipe = Recipe.new(title: data["title"], cook_time: data["cook_time"], prep_time: data["prep_time"],
            ratings: data["ratings"],category: data["category"], author: data["author"], image_url: data["image"])

  data["ingredients"].each do |ingredient_name|
    recipe.ingredients.build(name: ingredient_name)
  end

  recipes << recipe
end

Recipe.import recipes, recursive: true
