require_relative "./spec_helper"

describe "get /" do
  it "responds with success status" do
  	#arrange
  	#act
  	get '/'
  	#assert
  	# assert last_response.ok?
  	# expect(last_response.status).to equal(200)
  	expect(last_response).to be_ok
  end

end

describe "get /:user_id" do
	it "responds successfully" do
		get '/:user_id'
  	expect(last_response).to be_ok
	end
	  
end

describe "get /snake_hatch" do
  it "responds with success status" do
  	#arrange
  	#act
  	get '/snake_hatch'
  	#assert
  	expect(last_response).to be_ok
  end
end