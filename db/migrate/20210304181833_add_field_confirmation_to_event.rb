class AddFieldConfirmationToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :event_attendances, :confirmation, :boolean, dafault: false
    add_index :event_attendances, [:attended_event_id, :attendees_id], unique: true
  end
end
