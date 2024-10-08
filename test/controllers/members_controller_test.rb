require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/members.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Member.count, data.length
  end

  test "show" do
    get "/members/#{Member.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "phone_number", "position"], data.keys
  end

  test "create" do
    assert_difference "Member.count", 1 do
      post "/members.json", params: { name: "John", phone_number: "123-456-7890", position: "Deacon" }
      assert_response 200
    end
  end

  test "update" do
    @member = Member.first
    patch "/members/#{@member.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end  

  test "destroy" do
    assert_difference "Member.count", -1 do
      delete "/members/#{Member.first.id}.json"
      assert_response 200
    end
  end
end
