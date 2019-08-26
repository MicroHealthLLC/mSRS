class Principal < ApplicationRecord
  belongs_to :enumeration, polymorphic: true
  belongs_to :object, polymorphic: true


  def self.safe_attributes
    [:id, :enumeration_type, :enumeration_id, :object_type, :object_id, :_destroy ]
  end
end
