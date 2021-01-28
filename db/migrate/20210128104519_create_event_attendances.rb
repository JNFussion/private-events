class CreateEventAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendances do |t|
      t.belongs_to :attended_event
      t.belongs_to :attendees
      t.timestamps
    end
  end
end
