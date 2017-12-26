require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Creating a user with an Avatar" do
    visit users_url
    click_on "New User"
    
    fill_in 
    attach_file 'user_avatar', Rails.root.join('test/fixtures/files/1x1-ffffffff.png')
    click_on 'Create User'


    assert_selector "h1", text: "User"
  end
end
