get '/' do
	erb :index
end
# home page

# register page
get '/snake_hatch' do
	erb :create
end


get '/welcome_page' do
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
	user_find = User.find_by(snake_name: params[:snake_name])
	if user_find == nil
	user = User.create(params)
		session[:user_id] = user.id
		redirect '/snake_hatch'
	end
	redirect '/'
end



