class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.string :api_key
      t.string :country
      t.string :recipe_link
      t.string :recipe_title

      t.timestamps
    end
  end
end
