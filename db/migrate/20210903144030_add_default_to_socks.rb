class AddDefaultToSocks < ActiveRecord::Migration[6.1]
  def change
    change_column :socks, :quantity, :integer, default: 0
  end
end
