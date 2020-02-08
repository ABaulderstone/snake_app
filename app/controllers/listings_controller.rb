class ListingsController < ApplicationController
    def index 
        @listings = Listing.all
    end
    
    def show 
        id = params[:id]
        @listing = Listing.find(id)
    end 

    def new

    end 

    def create

    end 

    def edit

    end 

    def update

    end 
end