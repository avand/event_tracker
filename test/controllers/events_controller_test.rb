require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @org = orgs(:one)
    @event = events(:one)
  end

  test "should get new" do
    get new_org_event_url(@org)
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post org_events_url(@org), params: { event: {
        hostname: @event.hostname,
        name: @event.name,
        org_id: @event.org_id,
        timestamp: @event.timestamp
      } }
    end

    assert_redirected_to org_event_url(@org, Event.last)
  end

  test "should show event" do
    get org_event_url(@org, @event)
    assert_response :success
  end

  test "should get edit" do
    get edit_org_event_url(@org, @event)
    assert_response :success
  end

  test "should update event" do
    patch org_event_url(@org, @event), params: { event: {
      hostname: @event.hostname,
      name: @event.name,
      org_id: @event.org_id,
      timestamp: @event.timestamp
    } }

    assert_redirected_to org_event_url(@org, @event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete org_event_url(@org, @event)
    end

    assert_redirected_to org_events_url
  end

  test "should list all events in reverse chronological order" do
    get org_events_url(@org)

    assert_response :success
    assert_select "tbody tr", 2
    assert_select "tbody tr:nth-child(1) td:nth-child(1)", events(:two).name
    assert_select "tbody tr:nth-child(2) td:nth-child(1)", events(:one).name
  end

  test "should limit the number of events" do
    get org_events_url(@org, limit: 1)

    assert_select "tbody tr", 1
  end

  test "should filter events by hostname" do
    get org_events_url(@org, hostname: "google.com")

    assert_select "tbody tr", 1
  end
end
