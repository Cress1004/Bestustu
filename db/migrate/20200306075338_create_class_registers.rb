class CreateClassRegisters < ActiveRecord::Migration[6.0]
  def change
    create_table :class_registers do |t|
      t.string :description
      t.float :hours_lesson
      t.float :lessons_week
      t.float :salary
      t.integer :num_tutor
      t.references :location, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
