class Relationship < ActiveRecord::Base
  belongs_to :user_id, foreign_key: "follower_id", class_name: "User"
  belongs_to :following_id, foreign_key: "followed_id",  class_name: "User"
end
