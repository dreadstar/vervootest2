module ApplicationHelper
  def format_action_type(instance)
    instance.class.name.gsub("Action", "")
  end
end
