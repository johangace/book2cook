class CookbookEntry < ApplicationRecord
  belongs_to :cookbook
  belongs_to :recipe
end
