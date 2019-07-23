require 'test_helper'

class NakayamaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nakayama_index_url
    assert_response :success
  end

end
