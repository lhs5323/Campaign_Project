class Volunteer < ActiveRecord::Base
    has_many :tasks
    attr_accessible :name, :twitter_key, :user_ID, :total_points, :twitter_secret_key
    def self.create_with_omniauth(auth)
        if(Volunteer.exists?(user_ID: auth["uid"]))
            return Volunteer.find_by_user_ID(auth["uid"])
        end
        Volunteer.create!(
            :user_ID => auth["uid"], 
            :name => auth["info"]["name"],
            :twitter_key => ["oauth_token"],
            :twitter_secret_key => ["oauth_token_secret"],
            #:twitter_secret_key => ["oauth_token_secret"])
            :total_points => 0)
    end
end