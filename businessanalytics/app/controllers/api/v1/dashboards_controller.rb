module Api
  module V1
    class DashboardsController < ApplicationController
      def index
        dashboards = Dashboard.all
        render json: dashboards, status: :ok
      end

      def show
        dashboard = Dashboard.find(params[:id])
        render json: dashboard, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Dashboard not found" }, status: :not_found
      end

      def create
        dashboard = Dashboard.new(dashboard_params)
        if dashboard.save
          render json: dashboard, status: :created
        else
          render json: { errors: dashboard.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        dashboard = Dashboard.find(params[:id])
        if dashboard.update(dashboard_params)
          render json: dashboard, status: :ok
        else
          render json: { errors: dashboard.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Dashboard not found" }, status: :not_found
      end

      def destroy
        dashboard = Dashboard.find(params[:id])
        dashboard.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Dashboard not found" }, status: :not_found
      end

      private

      def dashboard_params
        params.require(:dashboard).permit(:name, :description, :user_id)
      end
    end
  end
end
