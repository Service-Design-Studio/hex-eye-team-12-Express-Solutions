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
service_table.each do |category, category_id, service, digital_time, branch_time, migratable, count, details, 
                        service_image_link, service_alt_text, cat_image_link, cat_alt_text|
AllService.create!( :category => category, 
                    :category_id => category_id, 
                    :service => service, 
                    :migratable => migratable, 
                    :count => count, 
                    :details => details, 
                    :digital_time => digital_time, 
                    :branch_time => branch_time,
                    :service_image_link => service_image_link,
                    :service_alt_text => service_alt_text,
                    :cat_image_link => cat_image_link,
                    :cat_alt_text => cat_alt_text
                    )
end

bank_details_table = CSV.read("db/sms_numbers.csv")
bank_details_table.each do |bank, branch_name, branch, sms_number|
    Branch.create!(:bank => bank, :branch_name => branch_name,:branch => branch, :sms_number => sms_number)
end

topics_table = CSV.read("db/topics.csv")
topics_table.each do |topic|
    Topic.create!(:topic => topic)
end
