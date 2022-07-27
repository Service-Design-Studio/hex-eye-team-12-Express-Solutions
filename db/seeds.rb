# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'csv'

service_table = CSV.read("db/clean_txn.csv")
service_table.each do |category, category_id,service_id, service, digital_time, branch_time, migratable, count, details, 
                        service_image_link, service_alt_text, cat_image_link, cat_alt_text, description, deep_link|
    AllService.create!( :category => category,
                        :category_id => category_id, 
                        :service_id => service_id, 
                        :service => service, 
                        :migratable => migratable, 
                        :count => count, 
                        :details => details, 
                        :digital_time => digital_time, 
                        :branch_time => branch_time,
                        :service_image_link => service_image_link,
                        :service_alt_text => service_alt_text,
                        :cat_image_link => cat_image_link,
                        :cat_alt_text => cat_alt_text,
                        :description => description,
                        :deep_link => deep_link
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

duration_table = CSV.read("db/branch_time.csv")
duration_table.each do |branch, id, wait_time|
    Duration.create!(:branch => branch, :branch_id => id, :wait_time => wait_time)
end