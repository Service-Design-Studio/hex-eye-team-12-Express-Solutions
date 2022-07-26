#Background
require 'csv'
Given /the data in "(.+)"$/ do |file|
    # table is a Cucumber::MultilineArgument::DataTable
    service_table = CSV.read("features/step_csv/#{file}")
    service_table.each do |category, category_id,service_id, service, digital_time, branch_time, migratable, count, details, 
                            service_image_link, service_alt_text, cat_image_link, cat_alt_text, description|
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
                            :description => description
                            )
    end
  end