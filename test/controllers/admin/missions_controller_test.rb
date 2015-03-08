require 'test_helper'

class Admin::MissionsControllerTest < ActionController::TestCase
  setup do
    @mission = missions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:missions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mission" do
    assert_difference('Mission.count') do
      post :create, mission: { active: @mission.active, contact: @mission.contact, country_id: @mission.country_id, description: @mission.description, end_date: @mission.end_date, language_id: @mission.language_id, name: @mission.name, start_date: @mission.start_date, user_id: @mission.user_id }
    end

    assert_redirected_to admin_mission_path(assigns(:mission))
  end

  test "should show mission" do
    get :show, id: @mission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mission
    assert_response :success
  end

  test "should update mission" do
    patch :update, id: @mission, mission: { active: @mission.active, contact: @mission.contact, country_id: @mission.country_id, description: @mission.description, end_date: @mission.end_date, language_id: @mission.language_id, name: @mission.name, start_date: @mission.start_date, user_id: @mission.user_id }
    assert_redirected_to admin_mission_path(assigns(:mission))
  end

  test "should destroy mission" do
    assert_difference('Mission.count', -1) do
      delete :destroy, id: @mission
    end

    assert_redirected_to admin_missions_path
  end
end
