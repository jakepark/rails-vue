Rails model thoughts

rails g model User email:string logged_in:boolean
# simple

rails g model Trip assignee_id:string owner_id:string ETA:datetime ETC:datetime status_id:string action_id:string

Screen 2 shows:

Assignee
Owner
ETA
ETC
Status
Actions

Assignee / Owner will be a User type, related to a UserTrip via foreign key User ID associations

ETA / ETC are simply datetime

Status - "In Progress" requires keeping track of when a trip has started, and calculating
the UserTrip status based on that. ( Bonus feature: track total duration )

Actions - 

### Frontend API response contract

# Console:

trips = Trip.all
  Trip Load (0.3ms)  SELECT "trips".* FROM "trips"

trips
=> 
[#<Trip:0x00007f81b9b9ee38
  id: 1,
  assignee_id: "1",
  owner_id: "1",
  ETA: nil,
  ETC: nil,
  status_id: "1",
  action_id: nil,
  created_at: Mon, 24 Jul 2023 18:54:30.692941000 UTC +00:00,
  updated_at: Mon, 24 Jul 2023 18:54:30.692941000 UTC +00:00>,
 #<Trip:0x00007f81b9b9ed98
  id: 2,
  assignee_id: "2",
  owner_id: "1",
  ETA: nil,
  ETC: nil,
  status_id: "1",
  action_id: nil,
  created_at: Mon, 24 Jul 2023 18:54:30.706386000 UTC +00:00,
  updated_at: Mon, 24 Jul 2023 18:54:30.706386000 UTC +00:00>]
