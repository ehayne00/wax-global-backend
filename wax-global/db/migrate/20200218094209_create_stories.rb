class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :user_id
      t.string :image
      t.string :video
      t.string :title
      t.string :content
      t.string :address
      t.string :latitude
      t.string :longitude
      t.string :country

      t.timestamps
    end
  end
end
