class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone_number, :text
    add_column :users, :address, :text
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :Bpoint, :integer
  end
end
