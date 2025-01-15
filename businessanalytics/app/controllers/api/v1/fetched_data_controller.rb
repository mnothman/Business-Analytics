module Api
  module V1
    class FetchedDataController < ApplicationController
      def index
        fetched_data = FetchedData.all
        render json: fetched_data, status: :ok
      end

      def show
        fetched_data = FetchedData.find(params[:id])
        render json: fetched_data, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Fetched data not found" }, status: :not_found
      end
    end
  end
end
