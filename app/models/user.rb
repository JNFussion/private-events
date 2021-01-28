class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id'
  has_many :event_attendance, foreign_key: "attendees_id"
  has_many :attended_event, through: :event_attendance, source: :attended_event
end
