require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest

  test "get new user form and create user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "john", email: "ant@example.com", password: "password"}
    end
    assert_template 'users/show'
  end

end
