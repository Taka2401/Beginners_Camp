module Api
  module v1
    class RelationshipsController < ActionController::API
      before_action :authenticate_user!

      def create
        @user = User.find(params[:followed_id])
        current_user.active_relationships.create!(relationships_params)
        head :created
      end

      def destroy
        current_user.active_relationships.find(params[:id]).destroy!
        head :ok
      end

      private

      def relationships_params
        params.require(:relationship).permit(:followed_id)
      end
    end
  end
end