json.array!(@nonprofits) do |nonprofit|
  json.extract! nonprofit, :email, :enabled, :name, :address1, :address2, :city, :state, :province, :postal_code, :country, :phone_number, :img_url, :website, :seo_name, :img_thumb_url
  json.url nonprofit_url(nonprofit, format: :json)
end
