# Event Tracker

This project is a submission for NewRelic’s coding challenge. The project is designed to track events for different organizations.

## My Thought Process

There wasn’t a ton of information to go on in terms of the design of this system so I tried to leverage as much as I could from Rails. I thought, “let me just create the models and basic views to support them and then an API will address the two requirements.”

To hit the ground running I used `rails generate scaffold` and the modified the views to my needs from there. I then implemented the search/filtering of events in the UI first, tested that functionality, and then made sure the API worked as I expected.

## How to Use

To create an event, you need to create an Org first. You can do that by going to http://nr-event-tracker.herokuapp.com/ and clicking “New Org.” I created a couple just to get things started.

### Create an Event

Once an Org exists, you can create an event via HTTP POST.

```
curl -d "event[name]=foo&event[timestamp]=2016-09-08T22:43:00.000Z&event[hostname]=foo.com" http://nr-event-tracker.herokuapp.com/orgs/2/events.json
```

### Retrieve Events via API

To retrieve events, simply perform an HTTP GET:

```
curl http://nr-event-tracker.herokuapp.com/orgs/1/events.json
```

By default, you’ll see 50 results in reverse chronological order. Limit results by providing a `limit` parameter and restrict events by hostname by providing a `hostname` parameter:

```
curl http://nr-event-tracker.herokuapp.com/orgs/1/events.json?limit=1&hostname=newrelic.com
```

Alternatively, you can use the UI provided mostly by Rails’ scaffolding to create and list events.
