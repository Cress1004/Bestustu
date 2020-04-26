class AddFieldToTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :num_class, :integer, default: 0
  end
end
