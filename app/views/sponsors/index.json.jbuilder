json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :email, :enabled, :name, :address1, :address2, :city, :state, :province, :postal_code, :country, :phone_number, :img_url, :website, :seo_name, :img_thumb_url
  json.url sponsor_url(sponsor, format: :json)
end
