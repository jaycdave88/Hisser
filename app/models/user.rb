class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :snake_name, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :hisses

  has_many :people, through: :relationships, source: :people
  has_many :relationships, foreign_key: :following_id, class_name: "Relationship"

  has_many :followings, through: :relationships, source: :following
  has_many :relationships, foreign_key: :person_id, class_name: "Relationship"


end
