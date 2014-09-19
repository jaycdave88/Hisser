class Hiss < ActiveRecord::Base
  validates :hiss, length: {maximum: 140}

  belongs_to :user

end
