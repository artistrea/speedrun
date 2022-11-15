class Api::V1::FriendshipsController < ApplicationController
    def index
        render json: Friendship.all, status: :ok
    end
    
    def show
        render json: Friendship.find(params[:id]), status: :ok
    rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :not_found
    end
    
    def create
        render json: Friendship.create!(friendship_params), status: :ok
    rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.message }, status: :unprocessable_entity
    end
    
    def update
        render json: Friendship.update!(params[:id], friendship_params), status: :ok
    rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :not_found
    rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.message }, status: :unprocessable_entity
    end
    
    def delete
        render json: Friendship.destroy!(params[:id]), status: :ok
    rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :not_found
    rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
    end
    
    private
    
    def friendship_params
        params.require(:friendship).permit(
            :user_id,
            :friend_id,
        )
    end
end
