class SessionsController < ApplicationController
    def create
        user=User.find_by(email: params[:email]).
           try( :authenticate, params[:password])

        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: user
            }
        else
            render json: { errors: 'Invalid Password or Username'}, status: :unauthorized
        end

    end
end
