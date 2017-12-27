require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  # This test will hit the external API
  test "Creating a user with an Avatar" do
    user_count = User.count

    visit users_url
    click_on "New User"
    
    fill_in 'user_name', with: 'Mr User Name'
    attach_file 'user_avatar', file_fixture('1x1-ffffffff.png')
    click_on 'Create User'

    assert_selector('#notice', text: 'User was successfully created.')

    # Verify the DB saved correctly
    assert(User.count, user_count + 1)
    assert(User.last.name, 'Mr User Name')
    assert(User.last.avatar.present?, true)

    # Verify cloudinary processed the image.
    assert(User.last.avatar.cloudinary_resource['tags'].join(','), User.last.avatar.tags)
  end
end
