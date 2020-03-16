class AddFieldUpdateVer1 < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :work_place, :string
    add_column :class_registers, :address, :string
    add_column :students, :description, :string
    change_column :class_registers, :salary, :float
    change_column :users, :admin, :boolean, default: false
  end
end
