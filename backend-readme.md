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