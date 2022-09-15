class InvitesController < ApplicationController

    def index 
        @invites = Invite.all
    end 

    def show
        @invite = Invite.find(param[:id]) 
    end 

    def new
        @invite = Invite.new 
    end 

    def create 
        @event = Event.find(params[:event_id])
        @invite = Invite.new(attended_event_id: @event.id, attendee_id: current_user.id)
        if @invite.save
            redirect_to @event 
        else 
            render events_path(@event), status: :unprocessable_entity
        end 
    end 


end
