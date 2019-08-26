require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
    @organization = organizations(:one)
  end

  test "visiting the index" do
    visit organizations_url
    assert_selector "h1", text: "Organizations"
  end

  test "creating a Organization" do
    visit organizations_url
    click_on "New Organization"

    fill_in "Customer description", with: @organization.customer_description
    fill_in "Internal description", with: @organization.internal_description
    check "Is locked" if @organization.is_locked
    fill_in "Learning description", with: @organization.learning_description
    fill_in "Plan", with: @organization.plan_id
    fill_in "Strategic description", with: @organization.strategic_description
    click_on "Create Organization"

    assert_text "Organization was successfully created"
    click_on "Back"
  end

  test "updating a Organization" do
    visit organizations_url
    click_on "Edit", match: :first

    fill_in "Customer description", with: @organization.customer_description
    fill_in "Internal description", with: @organization.internal_description
    check "Is locked" if @organization.is_locked
    fill_in "Learning description", with: @organization.learning_description
    fill_in "Plan", with: @organization.plan_id
    fill_in "Strategic description", with: @organization.strategic_description
    click_on "Update Organization"

    assert_text "Organization was successfully updated"
    click_on "Back"
  end

  test "destroying a Organization" do
    visit organizations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organization was successfully destroyed"
  end
end
