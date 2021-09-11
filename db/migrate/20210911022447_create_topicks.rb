class CreateTopicks < ActiveRecord::Migration[5.2]
  def change
    create_table :topicks do |t|
      t.text :content
    end
  end
end
