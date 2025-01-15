class DashboardController < ApplicationController
    before_action :authenticate_user!
  
    def index
      # Example instance variable to pass data to the view
      @welcome_message = "Welcome to your dashboard, #{current_user.email}!"
    end
  end
  