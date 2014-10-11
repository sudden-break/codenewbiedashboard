require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  test "should get import" do
    get :import
    assert_response :success
  end

end
