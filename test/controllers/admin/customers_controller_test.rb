require "test_helper"

class Admin::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_customers_top_url
    assert_response :success
  end
end
