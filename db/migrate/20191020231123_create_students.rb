class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :cohort_num
      t.integer :age

      t.timestamps
    end
  end
end
