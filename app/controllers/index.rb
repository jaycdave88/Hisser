get '/' do
	erb :index
end
# home page

# register page
get '/snake_hatch' do
	erb :create
end


get '/welcome_page' do
	@user= User.find(session[:user_id])
 	@user.snake_name

	erb :welcome
end

get '/check' do
	user = User.find_by(snake_name: params[:name])
	if user == nil
		erb :not_found
	else
		session[:user_id] = user.id
		redirect "/welcome_page"
		erb :welcome
	end
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

post '/new_hiss' do
	Hiss.create(user_id: params[:user_id], hiss: params[:hissing])
	redirect '/welcome_page'
end

