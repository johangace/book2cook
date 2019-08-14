class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :state, length: {is: 2}
  validates :zipcode, length: {is: 5}, format: { with: /\d\d\d\d\d/ }
  validates :street, :city, presence: true

  def avatar_url(size="400x400")
    if avatar.attached?
      avatar.variant(resize: size)
    else
      '/dummy-profile.jpg'
    end
  end
end
