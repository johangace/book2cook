class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :name, presence: true
  validates :state, presence: true, length: {is: 2}, on: :update
  validates :zipcode, presence: true, length: {is: 5}, format: { with: /\d\d\d\d\d/ }, on: :update
  validates :street, :city, presence: true, on: :update
  
  def avatar_url(size="400x400")
    if avatar.attached?
      avatar.variant(resize: size)
    else
      '/dummy-profile.jpg'
    end
  end
end
