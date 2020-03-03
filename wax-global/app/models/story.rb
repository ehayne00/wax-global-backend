class Story < ApplicationRecord
    has_many :favourites
    belongs_to :user

    validate :image_xor_video
    validates :title, { presence: true, length: {maximum: 100} }
    validates :content, { presence: true, length: {maximum: 3000}}
    validates :address, { presence: true }

    private

    def image_xor_video
      unless image.blank? ^ video.blank?
        errors.add(:base, "You must select an image or video.")
      end
    end



end
