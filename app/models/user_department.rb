class UserDepartment < ApplicationRecord
  belongs_to :user
  belongs_to :department
  validates_uniqueness_of :department_id, scope:  [:user_id]
end
