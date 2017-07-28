require 'test_helper'

class WagonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wagon_index_url
    assert_response :success
  end

  test "should get edit" do
    get wagon_edit_url
    assert_response :success
  end

  test "should get new" do
    get wagon_new_url
    assert_response :success
  end

  test "should get show" do
    get wagon_show_url
    assert_response :success
  end

end
