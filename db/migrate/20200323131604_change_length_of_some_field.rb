class ChangeLengthOfSomeField < ActiveRecord::Migration[6.0]
  def change
    change_column :class_registers, :class_content, :text
    change_column :messages, :message_content, :text
    change_column :students, :description, :text
    change_column :tutors, :description, :text
    change_column :tutors, :achievement, :text
  end
end
