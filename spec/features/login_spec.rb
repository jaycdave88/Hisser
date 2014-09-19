require_relative "../spec_helper"

feature "login process" do
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

  scenario "signs in to welcome page existing users" do
  	visit '/'
  	within(".user_login") do
  		fill_in "snake_name", with: "Testicles"
  		fill_in "password", with: "qwerty"
  	end
  	click_button 'login_submit'
  	expect(page).to have_content 'Welcome'
  end

  given(:guest_user) { User.new(
    	snake_name:"Head",
    	password:"Shoulders",
    	) }

  scenario "doesn't sign in a non-username, goes to NOT FOUND page instead" do
    visit '/'
    within(".user_login") do
      fill_in "snake_name", with: guest_user.password
      fill_in "password", with: guest_user.snake_name
    end
    click_button 'login_submit'
    expect(page).to have_content 'NOT FOUND'
  end

  scenario "doesn't sign in a correct username but bad password, stay on the login page" do
  	visit '/'
  	within(".user_login") do
  		fill_in "snake_name", with: "Testicles"
  		fill_in "password", with: "bad password"
  	end
  	click_button 'login_submit'
  	expect(page).to have_content 'Login'
  end

end
