class CreateSubjectsTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects_tutors, id: false do |t|
      t.references :tutor, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
    end
  end
end
