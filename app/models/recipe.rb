class Recipe < ApplicationRecord
  include Search
  belongs_to :user
  has_many :cookbook_entries
  has_many :books,  through: :cookbook_entries

  has_one_attached :image 
  validates :image,   presence: true
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
