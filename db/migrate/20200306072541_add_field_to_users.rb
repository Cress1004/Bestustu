class AddFieldToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :gender, :integer
    add_column :users, :age, :integer
    add_column :users, :bpoint, :float
    add_column :users, :admin, :boolean
  end
end
