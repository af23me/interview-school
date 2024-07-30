class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :reference_number, null: false

      t.timestamps
    end
    add_index :teachers, :reference_number, unique: true
  end
end
