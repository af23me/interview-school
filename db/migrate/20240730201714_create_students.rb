class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.text :first_name, null: false
      t.text :last_name, null: false
      t.string :reference_number, null: false

      t.timestamps
    end
    add_index :students, :reference_number, unique: true
  end
end
