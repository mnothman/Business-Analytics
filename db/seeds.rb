# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# user = User.create!(email: "test@example.com", password: "password")


# data_source = user.data_sources.create!(
#     name: "Google Analytics",
#     integration_type: "google_analytics",
#     connection_details: { api_key: "your_api_key" }
#   )
  
#   dashboard = user.dashboards.create!(
#     name: "Website Traffic",
#     description: "Analytics dashboard for website traffic"
#   )
  
#   FetchedDatum.create!(
#     data_source: data_source,
#     dashboard: dashboard,
#     data: { page_views: 1000, unique_visitors: 200 },
#     fetched_at: Time.current
#   )


#   Change from Create! to find_or_initialize_by
# Ensure the user is only created if it doesn't already exist
user = User.find_or_create_by!(email: "test@example.com") do |u|
    u.password = "password"
  end

# Ensure the data source is created only if it doesn't exist
data_source = user.data_sources.find_or_create_by!(
    name: "Google Analytics",
    integration_type: "google_analytics"
  ) do |ds|
    ds.connection_details = { api_key: "your_api_key" }
  end
  
  # Ensure the dashboard is created only if it doesn't exist
  dashboard = user.dashboards.find_or_create_by!(
    name: "Website Traffic",
    description: "Analytics dashboard for website traffic"
  )
  
  # Ensure the fetched data is created only if it doesn't exist
  FetchedDatum.find_or_create_by!(
    data_source: data_source,
    dashboard: dashboard,
    fetched_at: Time.current
  ) do |fd|
    fd.data = { page_views: 1000, unique_visitors: 200 }
  end

