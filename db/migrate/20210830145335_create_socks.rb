class CreateSocks < ActiveRecord::Migration[6.1]
  def change
    create_table :socks do |t|
      t.string :type
      t.float :price
      t.string :size
      t.string :color
      t.text :description

      t.timestamps
    end
  end
end
