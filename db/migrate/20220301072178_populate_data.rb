class PopulateData < ActiveRecord::Migration[6.1]
  def up
    raw_data = File.read('recipes-english.json')
    parse_data = JSON.parse(raw_data)
    count = 0
    recipes = []
    parse_data.each do |data|
      recipe = Recipe.new(title: data["title"], cook_time: data["cook_time"], prep_time: data["prep_time"],
                ratings: data["ratings"],category: data["category"], author: data["author"], image_url: data["image"])

      data["ingredients"].each do |ingredient_name|
        count += 1
        recipe.ingredients.build(name: ingredient_name)
      end

      recipes << recipe
      break if count > 5000
    end

    Recipe.import recipes, recursive: true
  end
end
