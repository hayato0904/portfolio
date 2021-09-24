class Comment < ApplicationRecord
  belongs_to :topick
  validates :content, presence: true
  validates :content, length: { in: 1..255 } 
end
