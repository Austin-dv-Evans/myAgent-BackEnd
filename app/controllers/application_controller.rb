class ApplicationController < ActionController::API
    before_action :authorized
    skip_before_action :authorized, only: [:login]


    def current_musician
        auth_header = request.headers["Authorization"]
        if auth_header
            token = auth_header.split(" ")[1]
            begin
                @musician_id = JWT.decode(token, "penguin")[0]["musician_id"]
            rescue JWT::DecodeError
                nil
            end
        end
        @musician = Musician.find(@musician_id)
    end

    def logged_in?
        !!current_musician
    end

    def authorized 
        render json: {message: "Please Log in"}, status: :unauthorized unless logged_in?
    end
    
    
    def login
        @musician = Musician.find_by(username: params[:username])
        if @musician && @musician.authenticate(params[:password])
            @token = JWT.encode({musician_id: @musician.id}, "penguin")
            render json: {musician: @musician, gigs: @musician.gigs, token: @token}, status: :accepted
        else
            render json: { errors: ['Invalid username or password'] }, status: :unauthorized
        end
    end

    
end
