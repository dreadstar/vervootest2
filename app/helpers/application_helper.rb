module ApplicationHelper
  def format_action_type(instance)
    instance.class.name.gsub("Action", "")
  end

  def action_type_collection
    [["Scavenger", "scavenger"], ["Simpleshare", "simpleshare"]]
  end

  def available_nonprofits
    collection = []

    Nonprofit.all.each do |nonprofit|
      collection << [nonprofit.name, nonprofit.id]
    end

    collection
  end

  def available_sponsors
    collection = []

    Sponsor.all.each do |nonprofit|
      collection << [nonprofit.name, nonprofit.id]
    end

    collection
  end

end
