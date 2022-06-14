# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# more_services = [
#   {:name => 'test_name', :description => 'test_description', :requirements => 'test_requirements', :ttc => 'test_ttc', :service_id => 'test_service_id'}
# ]

# more_services.each do |service|
#   Service.create!(service)
# end

require 'csv'

table = CSV.read("db/Dummy_services.csv")
table.each do |name, description, requirements, ttc, service_id|
    Service.create!(name: name, description: description, requirements: requirements, ttc: ttc, service_id: service_id)
end
