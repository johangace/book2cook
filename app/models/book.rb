class Book < ApplicationRecord
    has_many :cookbook_entries
    has_many :recipes, through: :cookbook_entries
    
    validates :name, presence: true
end
