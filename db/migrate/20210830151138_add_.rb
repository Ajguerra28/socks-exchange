class Add < ActiveRecord::Migration[6.1]
  def change
    add_reference :socks, :owner, index: true, foreign_key: {to_table: :users}
  end
end
