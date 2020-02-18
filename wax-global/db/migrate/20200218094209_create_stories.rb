class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :user_id
      t.string :image
      t.string :title
      t.string :content
      t.string :region
      t.string :country
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
