class RemoveColumnToClassRegister < ActiveRecord::Migration[6.0]
  def change
    remove_column :class_registers, :status
    remove_column :class_registers, :content
    add_column :class_registers, :class_status, :string, default: "ĐANG TÌM GIÁO VIÊN"
    add_column :class_registers, :class_content, :string
  end
end
