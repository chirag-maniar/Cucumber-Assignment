Feature: Check the Wikipedia apk upload and test the app using BrowserStack app automate feature
 
 
Scenario Outline: Upload apk and test the app successfully
  Given app path <path> for <username> and <access_key>
  When I upload the app to BrowserStack app automate
  Then I should receive bsurl for <path>
  Then I send that bsurl for testing the app and check whether the test is completed
 
 @test
 Examples:
 | path 												| username 		  | access_key             |
 | "@/Users/chiragmaniar/Downloads/WikipediaSample.apk" | "********" | "*******" |