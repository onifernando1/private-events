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
            # render :new, status: :unprocessable_entity
            redirect_to @event,status: :unprocessable_entity

        end 
    end 

    private 

    def invite_params
        params.require(:invite).permit(:attended_event_id, :attendee_id)

    end 


end
