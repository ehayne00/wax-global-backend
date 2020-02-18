class Story < ApplicationRecord
    has_many :favourites
    belongs_to :user
    

end
