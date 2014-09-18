get '/' do
	erb :index
end
# home page

get '/:user_id' do
	erb :welcome
end
# user's page

get '/snake_hatch' do 
	erb :create
end
# register page