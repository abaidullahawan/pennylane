class Recipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :cook_time
      t.integer :prep_time
      t.float :ratings
      t.string :category
      t.string :author
      t.string :image_url
    end
  end
end
