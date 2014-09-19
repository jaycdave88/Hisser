require_relative "../spec_helper"

feature "register process", :type => :feature do
  before :each do
    User.create(
    	snake_name:"Testicles",
    	first_name:"Hairy",
    	last_name:"Balls",
    	email:"Gametes@genepool.com",
    	password:"qwerty",
    	avatar:"http://i.imgur.com/Y4S7Bx9.gif"
    	)
  end

  scenario "take potential cool g-snakes to account creation page when they click register" do
  	visit '/'
  	within(".new_account") do
	  	click_button 'register_submit'
  	end
  	expect(page).to have_content 'Register'
  end



end