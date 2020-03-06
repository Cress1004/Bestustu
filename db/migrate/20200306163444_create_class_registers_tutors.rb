class CreateClassRegistersTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :class_registers_tutors, id: false do |t|
      t.references :class_register, index: true, foreign_key: true
      t.references :tutor, index: true, foreign_key: true
    end
  end
end
