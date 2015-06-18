class WebChallenge < Statsdb
    self.table_name = 'web_challenges'
    belongs_to :challenge

end
