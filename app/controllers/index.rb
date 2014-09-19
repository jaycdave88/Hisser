require 'pry'
get '/' do
	session[:username] = nil
	erb :index
end
# home page

# register page
get '/snake_hatch' do
	session[:username] = nil
	erb :create
end

get '/welcome_page' do
	redirect '/' if session[:username] == nil
	erb :welcome
end

get '/check' do
	user = User.find_by(snake_name: params[:snake_name])

	if user == nil
		erb :not_found
	elsif user.password != params[:password]
		redirect '/'
	else
		session[:username] = user.snake_name
		redirect "/welcome_page"
		erb :welcome
	end
end

get '/:user_id' do
	redirect '/' if session[:username] == nil
	erb :snake_profile
end

post '/snake_hatch' do
	if params[:snake_name] == "" || params[:password] == ""
		redirect '/snake_hatch'
	else
	user_find = User.find_by(snake_name: params[:snake_name])
	end
	if user_find == nil
	user = User.create(params)
		session[:username] = user.id
		redirect '/'
	end
end


