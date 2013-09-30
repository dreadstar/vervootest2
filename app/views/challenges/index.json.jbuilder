json.array!(@challenges) do |challenge|
  json.extract! challenge, :name, :description, :start_date, :end_date, :challenge_img, :total_offer, :amount_raised, :sponsor_blurb, :charity_blurb, :enabled, :seo_name, :img_thumb_url, :logo_url
  json.url challenge_url(challenge, format: :json)
end
