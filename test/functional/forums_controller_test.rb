require 'test_helper'

class ForumsControllerTest < ActionController::TestCase

  # 载入测试的数据
  fixtures :users, :forums, :topics, :posts

  def setup
    @controller = ForumsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:forums)
  end

  test "show all topics in the forum" do
    get :show, :id => 2
    assert_response :success
    assert_template 'show'
    assert_not_nil assigns(:forum)
    assert_not_nil assigns(:topics)
  end
end
