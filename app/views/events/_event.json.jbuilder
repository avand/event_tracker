json.extract! event, :id, :name, :timestamp, :hostname
json.url org_event_url(@org, event, format: :json)
