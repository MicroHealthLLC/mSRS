class CreatePrincipals < ActiveRecord::Migration[5.2]
  def change
    create_table :principals do |t|
      t.string :enumeration_type
      t.integer :enumeration_id
      t.integer :object_id
      t.string :object_type

      t.timestamps
    end
  end
end
