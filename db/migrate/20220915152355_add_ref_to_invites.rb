class AddRefToInvites < ActiveRecord::Migration[7.0]
  def change
    add_reference :invites, :attended_event
    add_reference :invites, :attendee

  end
end
