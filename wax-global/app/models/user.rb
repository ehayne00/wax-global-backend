class User < ApplicationRecord
    has_many :favourites, dependent: :destroy
    has_many :stories, dependent: :destroy
    has_secure_password
    
    validates :username, {presence: true, uniqueness: true}
    validates :password_digest, {presence: true, length: {minimum: 6}}
    validates :email, {presence: true}
    validates_format_of :email, with:/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

end
