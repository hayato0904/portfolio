class User < ApplicationRecord
  has_many :topicks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
