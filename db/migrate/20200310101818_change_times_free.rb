class ChangeTimesFree < ActiveRecord::Migration[6.0]
  def change
    remove_column :times_frees, :morning
    remove_column :times_frees, :afternoon
    remove_column :times_frees, :evening
    add_column :times_frees, :free_time, :string
  end
end
