require 'test_helper'

class ToDoListsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get to_do_lists_show_url
    assert_response :success
  end

  test "should get new" do
    get to_do_lists_new_url
    assert_response :success
  end

  test "should get create" do
    get to_do_lists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get to_do_lists_destroy_url
    assert_response :success
  end

end
