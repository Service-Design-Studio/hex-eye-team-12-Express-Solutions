When (/I type in "(.*)" into the search bar/) do | keyword |

    # fill_in 'myInput', :with => keyword
    # expect(page).to have_xpath("//input[@value='#{keyword}']")
    # uses keypress to trigger js
    input = find_field 'myInput'
    input.send_keys keyword, :enter
    sleep 2
end

Then (/I should see "(.*)" in the dropdown/) do | keyword |

    expect(page).to have_css("ul", text: keyword)
    #
end

But (/I should not see "(.*)" in the dropdown/) do | keyword |
    expect(page).not_to have_css("#results a", text: keyword, visible: :all)
end

 And (/I click on the "(.*)" in the dropdown/) do | service |
    # thing = find_field 'results'
    # thing.click_link service
    find(:xpath, "(//a[text()='#{service}'])").click
    
 end
   
Then (/I will see "(.*)" in the search bar/) do | service |
    expect(page).to have_field("myInput", with: "#{service}")
end
    
# When (/I see the dropdown without any options/) do

#Background
require 'csv'
Given /the data in "(.+)"$/ do |file|
    # table is a Cucumber::MultilineArgument::DataTable
    service_table = CSV.read("db/#{file}")
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
    