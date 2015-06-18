class ChallengeUser < Statsdb
    self.table_name = 'challenge_users'
    belongs_to :challenge

end
