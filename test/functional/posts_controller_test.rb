require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def setup
    @controller = TopicsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end


  test "show tipic" do
    assert true
  end
end
