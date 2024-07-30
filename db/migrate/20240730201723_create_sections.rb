class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.string :title, null: false
      t.references :teacher_subject, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true
      t.integer :weekdays, array: true, default: [], null: false
      t.time :start_at, null: false
      t.time :end_at, null: false

      t.timestamps
    end
  end
end
