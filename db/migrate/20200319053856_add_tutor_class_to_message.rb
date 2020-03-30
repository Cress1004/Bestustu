class AddTutorClassToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :tutor_id, :integer
    add_column :messages, :student_id, :integer
    remove_column :class_registers, :num_tutor
  end
end
