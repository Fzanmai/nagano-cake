require "test_helper"

class ItemGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get item_genres_edit_url
    assert_response :success
  end

  test "should get create" do
    get item_genres_create_url
    assert_response :success
  end

  test "should get update" do
    get item_genres_update_url
    assert_response :success
  end

  test "should get destroy" do
    get item_genres_destroy_url
    assert_response :success
  end
end
