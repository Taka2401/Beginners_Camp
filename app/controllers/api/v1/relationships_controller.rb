module Api
  module V1
    class RelationshipsController < ActionController::API
      before_action :authenticate_user!

      def index
        render json: Relationship.filter_by_followed(params[:followed_id]).select(:id, :follower_id, :followed_id)
      end

      def create
        current_user.relationships.create(relationships_params)
        head :created
      end

      def destroy
        current_user.relationships.find(params[:id]).destroy!
        head :ok
      end

      private

      def relationships_params
        params.require(:relationship).permit(:followed_id)
      end
    end
  end
end
