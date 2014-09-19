get '/' do
	session[:user_id] = nil
	erb :index
end
# home page

# register page
get '/snake_hatch' do
	session[:user_id] = nil
	erb :create
end

get '/welcome_page' do
	redirect '/' if session[:user_id] == nil
	erb :welcome
end

get '/check' do
	user = User.find_by(snake_name: params[:snake_name])

	if user.password != params[:password]
		redirect '/'
	end

	if user == nil
		erb :not_found
	else
		session[:user_id] = user.snake_name
		redirect "/welcome_page"
		erb :welcome
	end
end

get '/:user_id' do
	redirect '/' if session[:user_id] == nil
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
		session[:user_id] = user.id
		redirect '/'
	end
end


