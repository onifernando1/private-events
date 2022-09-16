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

    # add in flash notices

    def create 
        @event = Event.find(params[:event_id])
        @invite = Invite.new(attended_event_id: @event.id, attendee_id: current_user.id)
        if @invite.save
            redirect_to @event 
        else 
            # render :new, status: :unprocessable_entity
            redirect_to @event, status: :unprocessable_entity

        end 
    end 


    def destroy 
        @event = Event.find(params[:event_id])
        @invite = Invite.find(params[:id])
        @invite.destroy
        redirect_to events_path
    end 


end
