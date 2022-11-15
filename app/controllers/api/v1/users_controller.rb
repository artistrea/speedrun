class Api::V1::UsersController < ApplicationController
    acts_as_token_authentication_handler_for User, only: %i[ logout ]

    def index
        render json: User.all, status: :ok
    end

    def show
        render json: User.find(params[:id]), status: :ok
    rescue ActiveRecord::RecordNotFound => e
        render json: e, status: :not_found
    end

    def create
        render json: User.create!(user_params), status: :ok
    rescue ActiveRecord::RecordInvalid => e
        render json: e, status: :unprocessable_entity
    end

    def update
        user = User.find(params[:id])
        user.update!(user_update_params)
        render json: user, status: :ok
    rescue ActiveRecord::RecordNotFound => e
        render json: e, status: :not_found
    rescue ActiveRecord::RecordInvalid => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        render json: User.destroy(params[:id]), status: :ok
    rescue ActiveRecord::RecordNotFound => e
        render json: e, status: :not_found
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end
    
    def login
        user = User.find_by(email: login_params[:email])

        raise 'Login inválido' if user == nil || !user.valid_password?(login_params[:password])

        render json: user, status: :ok
    rescue StandardError => e
        render json: e, status: :unauthorized
    end

    def logout
        current_user.authentication_token = nil
        current_user.save!
        render json: {message: "deslogado com sucesso!"}, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private

    def authenticate_admin
        render json: { message: "Proibido" }, status: :forbidden
    end

    def user_params
        params.require(:user).permit(
            :name,
            :description,
            :email,
            :password,
            :password_confirmation,
            :photo
        )
    end

    def login_params
        params.require(:user).permit(
            :email,
            :password
        )
    end

    def user_update_params
        params.require(:user).permit(
            :name,
            :description,
            :photo
        )
    end
    
end
