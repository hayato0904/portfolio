class AddUserRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user, foreign_key: true
    has_many :comments, dependent: :destroy
    belongs_to :user, optional: :true
  end
end
