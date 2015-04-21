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

  def available_prereqs(action_scavenger, scavenger_item)
    collection = []
    # action_scavenger.scavenger_items.where(["prereq_id not in (?) and prereq_id != ?",scavenger_item.prereq_ids,scavenger_item.id]).each do |prereq|
    action_scavenger.scavenger_items.where(["id != ?",scavenger_item.id]).each do |prereq|
      collection << [prereq.name, prereq.id]
    end

    collection
  end

end
