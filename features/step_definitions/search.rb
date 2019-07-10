require_relative '../../final'
require_relative '../../trial'


Given("app path {string} for {string} and {string}") do |string,username,access_key|
  @string = string
  @username = username
  @access_key = access_key
  up = Final.new(string)
  @path = up.path
  #puts @path
  expect(@path).to eql @string
end
  
When("I upload the app to BrowserStack app automate") do 
  puts "uploaded"
end
  
Then("I should receive bsurl for {string}") do |string|
  up = Final.new(string)
  @url = up.upload(@username, @access_key)
  # puts url
  
end

Then /^I send that bsurl for testing the app and check whether the test is completed$/ do
   initial = Trial.new
   p = initial.run(@url,@username,@access_key)
   
   final = Trial.new
   @txt = final.start
   expect(@txt).to eql "Completed"

end