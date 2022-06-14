class Api::V1::SessionsController < ApplicationController 
    def create 
        user = User.find_by(email: params[:email])
        if user.authenticate(params[:password])
            render json: UserSerializer.new(user), status: 201
        else 
            render json: {text: "Bad credentials"}, status: 418
        end
    end
end
