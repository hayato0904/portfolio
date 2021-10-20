class User < ApplicationRecord
  has_many :topicks
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 1..30 }
  validates :email, presence: true, length: { in: 1..255 }

  mount_uploader :image, ImageUploader
  
end
