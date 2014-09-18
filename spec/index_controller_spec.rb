require_relative "/spec_helper"

describe "Get /" do
  it "responds with success status" do
  	#arrange
  	#act
  	get '/'
  	#assert
  	expect(last_response.status).to equal(200)
  end
end