class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :snake_name, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :hisses

  has_many :followers, through: :relationships, source: :follower
  has_many :relationships, foreign_key: :followed_id, class_name: "Relationship"

  has_many :followed, through: :relationships, source: :followed
  has_many :relationships, foreign_key: :follower_id, class_name: "Relationship"


end
