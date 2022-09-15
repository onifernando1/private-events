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
        @event= Event.new(event_params)
        @event.build_user(current_user)
        if @event.save
            redirect_to @event
        else 
            render :new, status: :unprocessable_entity
        end 
    end 

    private

    def event_params
        params.require(:event).permit(:title, :description, :date, :location)
    end 

    
end
