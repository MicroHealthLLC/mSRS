class Principal < ApplicationRecord
  belongs_to :enumeration, polymorphic: true
  belongs_to :object, polymorphic: true

  validates_presence_of :enumeration_id

  scope :departments, -> { where(object_type: 'Department') }
  scope :organizations, -> { where(object_type: 'Organization') }

  def self.safe_attributes
    [:id, :enumeration_type, :enumeration_id, :object_type, :object_id, :_destroy ]
  end
end
