require "application_system_test_case"

class OrderChangesTest < ApplicationSystemTestCase
  setup do
    @order_change = order_changes(:one)
  end

  test "visiting the index" do
    visit order_changes_url
    assert_selector "h1", text: "Order Changes"
  end

  test "creating a Order change" do
    visit order_changes_url
    click_on "New Order Change"

    fill_in "Clothes", with: @order_change.clothes
    fill_in "Description", with: @order_change.description
    click_on "Create Order change"

    assert_text "Order change was successfully created"
    click_on "Back"
  end

  test "updating a Order change" do
    visit order_changes_url
    click_on "Edit", match: :first

    fill_in "Clothes", with: @order_change.clothes
    fill_in "Description", with: @order_change.description
    click_on "Update Order change"

    assert_text "Order change was successfully updated"
    click_on "Back"
  end

  test "destroying a Order change" do
    visit order_changes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order change was successfully destroyed"
  end
end
