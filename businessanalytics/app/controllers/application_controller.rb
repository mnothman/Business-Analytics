class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!

  def index
    # Example content
    @welcome_message = "Welcome to your dashboard, #{current_user.email}!"
  end
end
