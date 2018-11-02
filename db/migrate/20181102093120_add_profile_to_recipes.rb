class AddProfileToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :profile, foreign_key: true
  end
end
