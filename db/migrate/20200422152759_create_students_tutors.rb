class CreateStudentsTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :students_tutors, id: false do |t|
      t.references :student, index: true, foreign_key: true
      t.references :tutor, index: true, foreign_key: true
    end
  end
end
