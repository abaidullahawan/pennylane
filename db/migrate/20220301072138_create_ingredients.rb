class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.references :recipe
      t.string :name
      t.timestamps
    end
  end
end
