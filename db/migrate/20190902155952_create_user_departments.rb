class CreateUserDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_departments do |t|
      t.integer :user_id
      t.integer :department_id

      t.timestamps
    end
    add_index :user_departments, :user_id
  end
end
