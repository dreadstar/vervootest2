class UserActivityTracking < Statsdb
    self.table_name = 'user_activity_tracking'
    belongs_to :action_stub, :foreign_key => "activity_id"

end
