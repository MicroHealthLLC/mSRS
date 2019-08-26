class StrategicObjective < Enumeration
  # has_many :roles

  OptionName = :enumeration_strategic_objective

  def option_name
    OptionName
  end

  def objects
    Principal.where(:enumeration_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:enumeration_id => to.id)
  end
end