require_relative "./spec_helper"

# array = user.relationships.pluck(:followed_id)
describe "User model" do
  before :all do
    #seed with random data
    user1 = User.create(
    	snake_name:"Testicles",
    	first_name:"Hairy",
    	last_name:"Balls",
    	email:"Gametes@genepool.com",
    	password:"qwerty",
    	avatar:"http://i.imgur.com/Y4S7Bx9.gif"
    	)
  	user2 = User.create(
	  	snake_name:"Testicles2",
	  	first_name:"Hairy2",
	  	last_name:"Balls2",
	  	email:"Gametes2@genepool.com",
	  	password:"qwerty2",
	  	avatar:"http://i.imgur.com/Y4S7Bx9.gif"
  	)
    Hiss.create(user_id: 1, hiss: "I like your balls")
    Relationship.create(follower_id:2,followed_id:1)
    user1_follower_array = user1.relationships.pluck(:followed_id)
    assert user1_follower_array
  end


end

# array.each {|id| p Hiss.find_by(user_id: id).hiss}

