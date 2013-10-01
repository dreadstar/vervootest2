json.array!(@actions) do |action|
  json.extract! action, :name, :description, :enabled, :challenge_id, :subtype, :amt
  json.url action_url(action, format: :json)
end
