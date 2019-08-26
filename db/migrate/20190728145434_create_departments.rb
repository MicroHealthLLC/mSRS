class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :plan_id
      t.boolean :is_locked
      t.text :strategic_description
      t.text :customer_description
      t.text :internal_description
      t.text :learning_description

      t.timestamps
    end
  end
end
