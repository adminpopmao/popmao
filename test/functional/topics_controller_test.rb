require 'test_helper'

class TopicsControllerTest < ActionController::TestCase

  def setup
    @controller = TopicsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  test "show an topic" do
    get :show, :forum_id => 2, :id => 1
    assert_response :success
    assert_template 'show'
    assert_not_nil assigns(:topic)
    assert_not_nil assigns(:forum)
    assert_not_nil assigns(:post)
  end
end
