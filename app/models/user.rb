class User < ApplicationRecord
  has_many :topicks
  has_many :favorites, dependent: :destroy
  # devise :database_authenticatable, :registerable,
  # :recoverable, :rememberable
end
