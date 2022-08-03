When (/I type in "(.*)" into the search bar/) do | keyword |
    input = find_field 'myInput'
    input.send_keys keyword, :enter
    sleep 2
end

Then (/I should see "(.*)" in the dropdown/) do | keyword |
    expect(page).to have_css("li", text: keyword)
end

But (/I should not see "(.*)" in the dropdown/) do | keyword |
    expect(page).not_to have_css("#results a", text: keyword, visible: :all)
end

 And (/I click on the "(.*)" in the dropdown/) do | service |
    #https://www.guru99.com/xpath-selenium.html
    find(:xpath, "(//a[@id='#{service}'])").click
 end
   
Then (/I will see "(.*)" in the search bar/) do | service |
    expect(page).to have_field("myInput", with: "#{service}")
end
    
 Then (/I click on the ML button/) do
    find(:xpath, "(//element[@id='clickmeML'])").click
 end

#Background
require 'csv'
Given /the data in clean_txn.csv/ do
    # table is a Cucumber::MultilineArgument::DataTable
    service_table = CSV.read("db/clean_txn.csv")
    service_table.each do |category, category_id,service_id, service, digital_time, branch_time, migratable, count, details, 
                            service_image_link, service_alt_text, cat_image_link, cat_alt_text|
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
                            :cat_alt_text => cat_alt_text
                            )
    end
  end 
    