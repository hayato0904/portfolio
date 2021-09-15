class Comment < ApplicationRecord
  belongs_to :topick
  validates :content, presence: true
end
