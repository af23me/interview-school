class CreateClassrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :classrooms do |t|
      t.string :room_number, null: false
      t.string :building, null: false

      t.timestamps
    end
    add_index :classrooms, [:room_number, :building], unique: true
  end
end
