class AddUserRefToTopicks < ActiveRecord::Migration[5.2]
  def change
    add_reference :topicks, :user, foreign_key: true
  end
end
