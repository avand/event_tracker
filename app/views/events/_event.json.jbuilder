json.extract! event, :id, :name, :timestamp, :hostname, :org_id, :created_at, :updated_at
json.url event_url(event, format: :json)