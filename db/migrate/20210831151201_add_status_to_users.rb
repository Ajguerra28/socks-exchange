class AddStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :socks, :status, :integer, default: 0
  end
end
