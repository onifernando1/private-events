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
        @invite = current_user.invite.build()
        if @invite.save
            redirect_to @invite
        else 
            render :new, status: :unprocessable_entity
        end 
    end 


end
