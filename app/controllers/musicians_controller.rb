class MusiciansController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        @musicians = Musician.all
        render json: @musicians
    end

    def show
        @musician = Musician.find(params[:id])
        render json: @musician
    end

    def profile
        render json: {musicians: current_musician, gigs: current_musician.gigs}
    end

    def create
        @musician = Musician.new(musician_params)

        if @musician.valid?
            @musician.save
            @token = JWT.encode({musician_id: @musician.id}, "penguin")
            render json: {musician: @musician, gigs: @musician.gigs, token: @token}, status: :created
        else
            render json:{errors: @musician.errors.full_messages}, status: :not_acceptable
        end
    end


    private

    def musician_params
        params.require(:musician).permit(:username, :password, :name, :number_of_members, :lead_member, :minimum_garuntee)
    end
end
