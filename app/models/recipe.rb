class Recipe < ApplicationRecord
  has_one_attached :image 
  validates :name, 
    :ingredients, 
    :instructions, 
    presence: true,
    length: { minimum: 5 }

  def image_url(size="200x200")
    if image.attached?
      image.variant(resize: size)
    else
      'http://bottomlessbites.com/assets/recipe-placeholder.jpg'
    end
  end
end
