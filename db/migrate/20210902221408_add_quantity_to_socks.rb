class AddQuantityToSocks < ActiveRecord::Migration[6.1]
  def change
    add_column :socks, :quantity, :integer
  end
end
