class PopulateData < ActiveRecord::Migration[6.1]
  def up
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
  end

  def down
    Recipe.delete_all
    Ingredient.delete_all
  end
end
