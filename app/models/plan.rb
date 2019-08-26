class Plan < ApplicationRecord
  validates_presence_of :date
  validates_uniqueness_of :date

  def to_s
    date
  end
end
