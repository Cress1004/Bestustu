class CreateClassRegistersTimesFrees < ActiveRecord::Migration[6.0]
  def change
    create_table :class_registers_times_frees, id: false do |t|
      t.references :class_register, index: true, foreign_key: true
      t.references :times_free, index: true, foreign_key: true
    end
  end
end
