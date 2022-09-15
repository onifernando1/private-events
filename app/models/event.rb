class Event < ApplicationRecord
    belongs_to :creator, foreign_key:"creator_id", class_name: "User"
    has_many :invites, foreign_key: :attended_event_id
    has_many :attendees, through: :invites

end
