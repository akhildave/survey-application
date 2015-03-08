require 'test_helper'

class Admin::AboutStudiesControllerTest < ActionController::TestCase
  setup do
    @about_study = about_studies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:about_studies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create about_study" do
    assert_difference('AboutStudy.count') do
      post :create, about_study: { description1: @about_study.description1, description2: @about_study.description2, description3: @about_study.description3, heading: @about_study.heading, interest: @about_study.interest, subheading: @about_study.subheading }
    end

    assert_redirected_to admin_about_study_path(assigns(:about_study))
  end

  test "should show about_study" do
    get :show, id: @about_study
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @about_study
    assert_response :success
  end

  test "should update about_study" do
    patch :update, id: @about_study, about_study: { description1: @about_study.description1, description2: @about_study.description2, description3: @about_study.description3, heading: @about_study.heading, interest: @about_study.interest, subheading: @about_study.subheading }
    assert_redirected_to admin_about_study_path(assigns(:about_study))
  end

  test "should destroy about_study" do
    assert_difference('AboutStudy.count', -1) do
      delete :destroy, id: @about_study
    end

    assert_redirected_to admin_about_studies_path
  end
end
