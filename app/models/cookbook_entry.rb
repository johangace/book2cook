class CookbookEntry < ApplicationRecord
  belongs_to :book
  belongs_to :recipe
end
