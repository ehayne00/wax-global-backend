class Story < ApplicationRecord
    has_many :favourites
    belongs_to :user
    has_one_attached :picture
    has_one_attached :movie

    validate :image_xor_video
    validates :title, { presence: true, length: {maximum: 100} }
    validates :content, { presence: true, length: {maximum: 3000}}
    validates :address, { presence: true }

    private

    def image_xor_video
      begin
        unless picture.blank? ^ movie.blank?
          errors.add(:base, "You must select an image or a video.")
        end
      rescue
        errors.add(:base, "You must select an image or a video.")
      end
    end



end
