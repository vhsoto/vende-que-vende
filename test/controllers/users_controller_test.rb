require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:pepito)
  end
  
  test 'render get show' do
    get user_url(@user.username)

    assert_response :success
  end
end