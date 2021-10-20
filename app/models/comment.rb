class Comment < ApplicationRecord
  belongs_to :topick
  belongs_to :user, optional: :true
  validates :content, presence: true
  validates :content, length: { in: 1..255 } 
end
