class Invite < ApplicationRecord
    belongs_to :attended_event, class_name: "Event"
    belongs_to :attendee, class_name: "User"
    validates :attended_event, uniqueness:true 
    validates :attendee, uniqueness:true 


end
