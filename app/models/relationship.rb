class Relationship < ActiveRecord::Base
  belongs_to :person, foreign_key: "person_id", class_name: "User"
  belongs_to :following, foreign_key: "following_id",  class_name: "User"
end
