class ChangeColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :age
    add_column :users, :birthday, :date
  end
end
