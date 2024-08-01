require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/members.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Member.count, data.length
  end
end
