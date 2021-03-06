class Api::V1::UsersController < ApplicationController 
    def create 
       user = User.new(user_params)
       user.api_key = SecureRandom.base64(16)
       if user.save
        render json: UserSerializer.new(user), status: 201
       else 
        render json: {text: user.errors.full_messages[0] }, status: 418
       end
    end

    private 
    def user_params 
        params.permit(:email, :password, :password_confirmation)
    end
end
