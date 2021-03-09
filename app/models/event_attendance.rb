class EventAttendance < ApplicationRecord
  belongs_to :attended_event, class_name: "Event"
  belongs_to :attendees, class_name: "User"

  scope :attendance_confirmed, -> {where("confirmation = ?", true)}
  scope :attendance_unconfirmed, -> {where("confirmation is NULL")}
end
