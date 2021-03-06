require 'test_helper'

class OrderChangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_change = order_changes(:one)
  end

  test "should get index" do
    get order_changes_url
    assert_response :success
  end

  test "should get new" do
    get new_order_change_url
    assert_response :success
  end

  test "should create order_change" do
    assert_difference('OrderChange.count') do
      post order_changes_url, params: { order_change: { clothes: @order_change.clothes, description: @order_change.description } }
    end

    assert_redirected_to order_change_url(OrderChange.last)
  end

  test "should show order_change" do
    get order_change_url(@order_change)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_change_url(@order_change)
    assert_response :success
  end

  test "should update order_change" do
    patch order_change_url(@order_change), params: { order_change: { clothes: @order_change.clothes, description: @order_change.description } }
    assert_redirected_to order_change_url(@order_change)
  end

  test "should destroy order_change" do
    assert_difference('OrderChange.count', -1) do
      delete order_change_url(@order_change)
    end

    assert_redirected_to order_changes_url
  end
end
