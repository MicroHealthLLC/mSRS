class AddOrganizationIdToDepartment < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :organization_id, :integer
  end
end
