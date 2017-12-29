require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  # This test will hit the external API
  test "Creating a user with an Avatar" do
    user_count = User.count

    visit users_path
    click_on "New User"

    fill_in 'user_name', with: 'Mr User Name'
    attach_file 'user_avatar', file_fixture('1x1-ffffffff.png')
    click_on 'Create User'

    # Wait for image to finish uploading and for us to be sent to the index page.
    wait_for do
      current_path == users_path
    end

    assert_selector('#notice', text: 'User was successfully created.')

    # Verify the DB saved correctly
    assert_equal(User.count, user_count + 1, 'User count has increased by 1')
    assert_equal(User.last.name, 'Mr User Name')
    assert_equal(User.last.avatar.present?, true, 'User has an avatar')

    # Verify cloudinary processed the image.
    assert_equal(User.last.avatar.cloudinary_resource['tags'].join(','), User.last.avatar.tags, 'Remote tags have also updated')

    # Delete the image we've just uploaded.
    User.last.user.avatar.remove!
  end

  test "Updating a user who already has an Avatar" do
    user = users(:with_avatar)

    assert_not_equal(user.name, 'Mr User Name')
    assert_equal(user.avatar.present?, true, 'User has an avatar')

    visit edit_user_path(user)

    fill_in 'user_name', with: 'Mr User Name'
    click_on 'Update User'

    assert_selector('#notice', text: 'User was successfully updated.')

    # Verify the DB saved correctly
    user.reload
    assert_equal(user.name, 'Mr User Name')
    assert_equal(user.avatar.present?, true, 'User has an avatar')
  end
end
