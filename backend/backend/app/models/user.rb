class User < ApplicationRecord
    has_many :recipes
    has_secure_password
    validates :first_name, :last_name, :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true, length: {minimum: 8 }
end
