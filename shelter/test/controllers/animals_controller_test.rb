require 'test_helper'

class AnimalsControllerTest < ActionController::TestCase
  test "should get Users" do
    get :Users
    assert_response :success
  end

  test "should get Comments" do
    get :Comments
    assert_response :success
  end

end
