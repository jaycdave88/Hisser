require_relative "../spec_helper"

feature "register process" do

  scenario "take potential cool g-snakes to account creation page when they click register" do
  	visit '/'
  	within(".new_account") do
	  	click_button 'register_submit'
  	end
  	expect(page).to have_content 'Register'
  end

  scenario "allow cool g-snakes to register" do
  	visit '/snake_hatch'
  	within(".registration") do
  		fill_in "first_name", with: "Ruby"
  		fill_in "last_name",  with: "Python"
  		fill_in "snake_name", with: "Redsnake"
  		fill_in "password",   with: "ssss"
  		click_button 'register_submit'
  	end
  	expect(page).to have_content 'Login'
  end

  scenario "stop empty form fields from registering" do
  	visit '/snake_hatch'
  	within(".registration") do
  		click_button 'register_submit'
  	end
  	expect(page).to have_content 'Register'
  end

end
