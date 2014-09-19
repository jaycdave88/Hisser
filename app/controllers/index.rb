get '/' do
	erb :index
end
# home page


get '/snake_hatch' do 

	erb :create
end
# register page

get '/:user_id' do
	user_find = User.find_by(snake_name: params[:snake_name])
	if user_find == nil
		erb :not_found
	else
		session[:user_id] = user.id
		erb :welcome
	end
end
# user's page

post '/snake_hatch' do
	user_find = User.find_by(snake_name: params[:snake_name])
	if user_find == nil
	user = User.create(params)
		session[:user_id] = user.id
	end 
	redirect '/'
end