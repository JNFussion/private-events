class EventAttendance < ApplicationRecord
  belongs_to :attended_event, class_name: "Event"
  belongs_to :attendees, class_name: "User"
end