class CreateTopicks < ActiveRecord::Migration[5.2]
  def change
    create_table :topicks do |t|
      t.text :content
      t.timestamps
    end
  end
end
