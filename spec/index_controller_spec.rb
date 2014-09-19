require_relative "./spec_helper"

describe "get /" do
  it "responds with success status" do
  	get '/'
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
  	get '/snake_hatch'
  	expect(last_response).to be_ok
  end
end