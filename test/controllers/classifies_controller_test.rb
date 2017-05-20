require 'test_helper'

class ClassifiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classify = classifies(:one)
  end

  test "should get index" do
    get classifies_url
    assert_response :success
  end

  test "should get new" do
    get new_classify_url
    assert_response :success
  end

  test "should create classify" do
    assert_difference('Classify.count') do
      post classifies_url, params: { classify: { name: @classify.name } }
    end

    assert_redirected_to classify_url(Classify.last)
  end

  test "should show classify" do
    get classify_url(@classify)
    assert_response :success
  end

  test "should get edit" do
    get edit_classify_url(@classify)
    assert_response :success
  end

  test "should update classify" do
    patch classify_url(@classify), params: { classify: { name: @classify.name } }
    assert_redirected_to classify_url(@classify)
  end

  test "should destroy classify" do
    assert_difference('Classify.count', -1) do
      delete classify_url(@classify)
    end

    assert_redirected_to classifies_url
  end
end
