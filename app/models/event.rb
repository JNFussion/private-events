class Event < ApplicationRecord
  belongs_to :creator, class_name: :User
  has_many :event_attendance, foreign_key: "attended_event_id"
  has_many :attendees, through: :event_attendance, source: :attendees

  scope :past, -> { where("event_date < ?", Time.now) }
  scope :upcoming, -> { where("event_date > ?", Time.now) }
end
