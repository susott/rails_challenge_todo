require 'test_helper'

class ToDoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get to_do_new_url
    assert_response :success
  end

  test "should get create" do
    get to_do_create_url
    assert_response :success
  end

  test "should get destroy" do
    get to_do_destroy_url
    assert_response :success
  end

end
