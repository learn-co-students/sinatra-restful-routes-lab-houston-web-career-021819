class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |table|
      table.string :name
      table.string :ingredients
      table.integer :cook_time
    end
  end
end
