require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  test "should forward to first project" do
    get :index
    assert_response :redirect
  end
end
