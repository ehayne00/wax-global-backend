class Story < ApplicationRecord
    has_many :favourites
    belongs_to :user

    validates :image, { presence: true }
    validates :title, { length: {maximum: 200} }
    validates :region, { presence: true }
    validates :country, { presence: true }
    validates :latitude, { presence: true }
    validates :longitude, { presence: true }
    

end
