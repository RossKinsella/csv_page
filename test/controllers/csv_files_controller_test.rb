require 'test_helper'

class CsvFilesControllerTest < ActionController::TestCase
  test "should get input" do
    get :input
    assert_response :success
  end

  test "should get display" do
    get :display
    assert_response :success
  end

end
