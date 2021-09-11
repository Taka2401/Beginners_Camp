module Api
  module V1
    class RelationshipsController < ActionController::API
      before_action :authenticate_user!

      def create
        current_user.follow(relationships_params)
        head :created
      end

      def destroy
        current_user.unfollow(params[:user_id])
        head :ok
      end

      private

      def relationships_params
        params.require(:relationship).permit(:user_id, :followed_id)
      end
    end
  end
end