class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  def avatar_url(size="400x400")
    if avatar.attached?
      avatar.variant(resize: size)
    else
      '/dummy-profile.jpg'
    end
  end
end
