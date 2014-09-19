require_relative "./spec_helper"

# array = user.relationships.pluck(:followed_id)
describe "User model" do
  before :all do
    #seed with random data
    @user1 = User.create(
    	snake_name:"Testicles",
    	first_name:"Hairy",
    	last_name:"Ball",
    	email:"Gametes@genepool.com",
    	password:"qwerty",
    	avatar:"http://i.imgur.com/Y4S7Bx9.gif"
    	)
  	@user2 = User.create(
	  	snake_name:"Testicles2",
	  	first_name:"Smooth",
	  	last_name:"Ball",
	  	email:"Gametes2@genepool.com",
	  	password:"qwerty",
	  	avatar:"http://i.imgur.com/Y4S7Bx9.gif"
  	)
  	@test_hiss = "I like your balls bro"
    @user1.hisses.create(hiss: @test_hiss)
    @user1.relationships.create(followed_id:2)
  end


  it "has a user1 called Hairy" do
  	expect(@user1.first_name).to eq("Hairy")
  end

  it "has a hiss for user1" do
  	expect(@user1.hisses.pluck(:hiss).first).to eq(@test_hiss)
  end

  it "should identify followers for user1" do
    user1_follower_array = @user1.relationships.pluck(:followed_id)
    expect(user1_follower_array.first).to eq(2)
  end

end

# array.each {|id| p Hiss.find_by(user_id: id).hiss}

