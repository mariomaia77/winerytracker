require 'test_helper'

class RegionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get search_result" do
    get :search_result
    assert_response :success
  end

end
