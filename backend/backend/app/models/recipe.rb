class Recipe < ApplicationRecord
    belongs_to :user
    validates :name, :ingredients, presence: true
end
