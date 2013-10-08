json.array!(@action_bases) do |action_basis|
  json.extract! action_basis, :name, :description, :enabled, :challenge_id, :amt
  json.url action_basis_url(action_basis, format: :json)
end
