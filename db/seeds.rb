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

service_table = CSV.read("db/clean_txn.csv")
service_table.each do |category, category_int, service, migratable, count, details, digital_time, branch_time|
    AllService.create!(:category => category, :category_int => category_int, :service => service, :migratable => migratable, :count => count, :details => details, :digital_time => digital_time, :branch_time => branch_time)
end

bank_details_table = CSV.read("db/sms_numbers.csv")
bank_details_table.each do |bank, branch_name, branch, sms_number|
    Branch.create!(:bank => bank, :branch_name => branch_name,:branch => branch, :sms_number => sms_number)
end

# topics_table = CSV.read("db/topics.csv")
# topics_table.each do |topic|
#     Topic.create!(:topic => topic)
# end
