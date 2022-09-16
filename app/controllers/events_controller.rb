class EventsController < ApplicationController

    before_action :authenticate_user!

    def index
        @events = Event.all() 
    end 

    def show 
        @event = Event.find(params[:id])
    end 

    def new 
        @event = Event.new
    end 

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            redirect_to @event
        else 
            render :new, status: :unprocessable_entity
        end 
    end 

    def destroy 
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to events_path
    end 

    private

    def event_params
        params.require(:event).permit(:title, :description, :date, :location)
    end 

    
end
