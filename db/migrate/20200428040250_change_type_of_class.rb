class ChangeTypeOfClass < ActiveRecord::Migration[6.0]
  def change
    change_column :class_registers, :salary, :integer
    change_column :class_registers, :num_student, :integer
  end
end
