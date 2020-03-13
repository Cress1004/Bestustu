class AddColumnToClassRegister < ActiveRecord::Migration[6.0]
  def change
    add_column :class_registers, :status, :string, default: "ĐANG TÌM GIÁO VIÊN"
    add_column :class_registers, :tutor_gender, :string
    add_column :class_registers, :num_student, :float
    add_column :class_registers, :content, :string
  end
end
