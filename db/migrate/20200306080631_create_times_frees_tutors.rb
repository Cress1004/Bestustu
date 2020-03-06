class CreateTimesFreesTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :times_frees_tutors, id: false do |t|
      t.references :tutor, index: true, foreign_key: true
      t.references :times_free, index: true, foreign_key: true
    end
  end
end
