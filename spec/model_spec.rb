require_relative "./spec_helper"

describe User do
	#tests that the model has attributes
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:snake_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:avatar) }

  #swag tests - should pass eventually
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authentication) }
end

describe "Snakes in the model" do

	#arrange some test data to work with
  before :all do
    @user1 = User.create(
    	snake_name: "Left",
    	first_name: "Hairy",
    	last_name:  "Nut",
    	email: 		  "Left@testes.com",
    	password:   "qwerty",
    	avatar: 	  "http://i.imgur.com/Y4S7Bx9.gif"
    	)
  	@user2 = User.create(
	  	snake_name: "Right",
	  	first_name: "Smooth",
	  	last_name:  "Nut",
	  	email: 		  "Right@testes.com",
	  	password:   "qwerty",
	  	avatar: 	  "http://i.imgur.com/Y4S7Bx9.gif"
  		)
  	@test_hiss = "I like your ball bro"
    @user1.relationships.create(person_id:2)
    @user1_follower_array = @user1.relationships.pluck(:person_id)
  end

  it "can identify their own hisses" do
    @user1.hisses.create(hiss: @test_hiss)
  	expect(@user1.hisses.pluck(:hiss).first).to eq(@test_hiss)
  end

  it "can identify their followers" do
    expect(@user1_follower_array.first).to eq(2)
  end

	it "can identify who they're following" do
		@user2_is_following = @user2.relationships.pluck(:person_id).first
		expect(@user2_is_following).to equal(1)
	end

	it "can identify hisses from snakes they follow" do
		expect(@user2_is_following.first.hisses).to equal(@test_hiss)
	end

end


