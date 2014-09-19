require_relative "../spec_helper"

feature "login process", :type => :feature do
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

  scenario "signs me in" do
  	visit '/'
  	within(".user_login") do
  		fill_in "snake_name", with: "Testicles"
  		fill_in "password", with: "qwerty"
  	end
  	click_button 'login_submit'
  	expect(page).to have_content 'welcome'
  end
end