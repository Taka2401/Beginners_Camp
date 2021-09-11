module Api
  module v1
    class RelationshipsController < ActionController::API
      before_action :authenticate_user!

      def create
        current_user.follow(params[:user_id])
        head :created
      end

      def destroy
        current_user.unfollow(params[:user_id])
        head :ok
      end

      # private

      # def relationships_params
      #   params.require(:relationship).permit(:followed_id)
      # end
    end
  end
end