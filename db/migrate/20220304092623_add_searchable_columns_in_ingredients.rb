class AddSearchableColumnsInIngredients < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      ALTER TABLE ingredients
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('english', coalesce(name, '')), 'A')
      ) STORED;
    SQL
  end

  def down
    remove_column :ingredients, :searchable
  end
end
