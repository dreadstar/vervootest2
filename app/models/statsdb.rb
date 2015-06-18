class Statsdb < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "stats_#{Rails.env}"
end
