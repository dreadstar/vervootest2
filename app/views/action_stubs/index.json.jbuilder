json.array!(@action_stubs) do |action_stub|
  json.extract! action_stub, :name, :description, :enabled, :challenge_id, :amt, :heir, :heir_type
  json.url action_stub_url(action_stub, format: :json)
end
