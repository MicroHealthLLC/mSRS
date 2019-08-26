class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :date
      t.boolean :is_locked

      t.timestamps
    end
  end
end
