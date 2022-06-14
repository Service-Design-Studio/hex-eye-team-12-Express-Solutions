require "application_system_test_case"

class ServicesTest < ApplicationSystemTestCase
  setup do
    @service = services(:one)
  end

  test "visiting the index" do
    visit services_url
    assert_selector "h1", text: "Services"
  end

  test "should create service" do
    visit services_url
    click_on "New service"

    fill_in "Description", with: @service.description
    fill_in "Name", with: @service.name
    fill_in "Requirements", with: @service.requirements
    fill_in "Service", with: @service.service_id
    fill_in "Ttc", with: @service.ttc
    click_on "Create Service"

    assert_text "Service was successfully created"
    click_on "Back"
  end

  test "should update Service" do
    visit service_url(@service)
    click_on "Edit this service", match: :first

    fill_in "Description", with: @service.description
    fill_in "Name", with: @service.name
    fill_in "Requirements", with: @service.requirements
    fill_in "Service", with: @service.service_id
    fill_in "Ttc", with: @service.ttc
    click_on "Update Service"

    assert_text "Service was successfully updated"
    click_on "Back"
  end

  test "should destroy Service" do
    visit service_url(@service)
    click_on "Destroy this service", match: :first

    assert_text "Service was successfully destroyed"
  end
end
