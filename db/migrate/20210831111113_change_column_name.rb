class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :socks, :type, :type_of_socks
  end
end
