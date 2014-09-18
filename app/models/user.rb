class User < ActiveRecord::Base
  has_many :hisses

  has_many :followers, through: :relationships, source: :follower
  has_many :relationships, foreign_key: :followed_id, class_name: "Relationship"

  has_many :followed, through: :relationships, source: :followed
  has_many :relationships, foreign_key: :follower_id, class_name: "Relationship"


end
