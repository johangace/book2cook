class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :state, length: {maximum: 2}
  validates :zipcode, length: {maximum: 5}

  def avatar_url(size="400x400")
    if avatar.attached?
      avatar.variant(resize: size)
    else
      '/dummy-profile.jpg'
    end
  end
end
