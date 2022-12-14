class Event < ApplicationRecord
    belongs_to :creator, foreign_key:"creator_id", class_name: "User"
    has_many :invites, foreign_key: :attended_event_id
    has_many :attendees, through: :invites

    validates :title, presence: true  
    validates :description, presence: true  
    validates :date, presence: true  
    validates :location, presence: true  

    scope :past, -> {where("date < ?", Date.today).order(date: :desc)}
    scope :future, -> {where("date > ?", Date.today).order(date: :asc)}
end
