module ApplicationHelper
  def format_action_type(instance)
    instance.class.name.gsub("Action", "")
  end

  def action_type_collection
    [["Scavenger", "scavenger"], ["Simpleshare", "simpleshare"]]
  end

end
