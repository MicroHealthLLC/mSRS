class Department < ApplicationRecord
  has_many :principals, as: :object

  has_many :strategic_objectives, -> { where enumeration_type: 'StrategicObjective' }, as: :object,  class_name: 'Principal'
  has_many :internal_perspectives, -> { where enumeration_type: 'InternalPerspective' }, as: :object,  class_name: 'Principal'
  has_many :customer_objectives, -> { where enumeration_type: 'CustomerObjective' }, as: :object,  class_name: 'Principal'
  has_many :learning_growths, -> { where enumeration_type: 'LearningGrowth' }, as: :object,  class_name: 'Principal'

  accepts_nested_attributes_for :principals, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :strategic_objectives, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :internal_perspectives, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :customer_objectives, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :learning_growths, reject_if: :all_blank, allow_destroy: true

  belongs_to :plan
  belongs_to :organization

  validates_uniqueness_of :name
  validates_presence_of :name, :plan_id, :organization_id

  has_many :user_departments
  has_many :users, through: :user_departments

  def self.visible
    return where(nil) if User.current.admin?
    User.current.departments
  end
end
