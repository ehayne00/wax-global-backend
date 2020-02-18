class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.string :user_id
      t.string :story_id

      t.timestamps
    end
  end
end
