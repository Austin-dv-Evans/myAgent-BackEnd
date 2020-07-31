class GigsController < ApplicationController
    before_action :find_gig, only: [:update, :destroy]

    def index 
        @gigs = Gig.all 

        render json: @gigs
    end

    # def show
    #     @gig = Gig.find(params[:id])
    #     render json: @gig
    # end

    def create 
        # byebug
        @gig = Gig.create(gig_params)
        

        render json: @gig, status: :created
    end

    def update
        @gig.update(gig_params)

        render json: @gig
    end
    

    def destroy
        @gig.destroy

        render status: :no_content
    end


    private

    def find_gig
        @gig = Gig.find(params[:id])
    end

    def gig_params
        params.require(:gig).permit(:venue_name, :date_time, :offer, :accepted, :paid, :musician_id)
    end

    # Gig.create(venue_name: "Venue X", date_time: "09-12-2020 8pm", offer: 250, accepted: false, paid: false, musician: band2)
    # # Parameters "musician_id"=>1, "venue_name"=>"The Ogden", "date_time"=>"08-25-2020 9pm", "offer"=>"150", "accepted"=>false, "paid"=>false
end
