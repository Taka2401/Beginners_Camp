module Api
  module V1
    class BookmarksController < ActionController::API
      before_action :authenticate_user!

      def index
        render json: Bookmark.filter_by_camp_place(params[:camp_place_id]).select(:id, :user_id, :camp_place_id)
      end

      def create
        current_user.bookmarks.create!(bookmarks_params)
        head :created
      end

      def destroy
        current_user.bookmarks.find(params[:id]).destroy!
        head :ok
      end

      private

      def bookmarks_params
        params.require(:bookmark).permit(:camp_place_id)
      end
    end
  end
end
