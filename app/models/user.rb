class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :books, dependent: :destroy

  def profile
    super || create_profile(name: email)
  end
end
