require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get settings_create_url
    assert_response :success
  end

  test "should get edit" do
    get settings_edit_url
    assert_response :success
  end

  test "should get delete" do
    get settings_delete_url
    assert_response :success
  end

  test "should get update" do
    get settings_update_url
    assert_response :success
  end

end
