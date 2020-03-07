class CreateTimesFrees < ActiveRecord::Migration[6.0]
  def change
    create_table :times_frees do |t|
      t.integer :day
      t.integer :morning
      t.integer :afternoon
      t.integer :evening

      t.timestamps
    end
  end
end
