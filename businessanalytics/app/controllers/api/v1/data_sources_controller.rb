module Api
  module V1
    class DataSourcesController < ApplicationController
      def index
        data_sources = DataSource.all
        render json: data_sources, status: :ok
      end

      def show
        data_source = DataSource.find(params[:id])
        render json: data_source, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Data source not found" }, status: :not_found
      end
    end
  end
end
