class CreateMessage < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :message_content
      t.references :user, null: false, foreign_key: true
    end
  end
end
