class RemovecolTimesFree < ActiveRecord::Migration[6.0]
  def change
    remove_column :times_frees, :day
    add_column :times_frees, :day, :string
  end
end
