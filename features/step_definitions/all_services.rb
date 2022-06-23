#Background
Given('the following categories exist:') do |all_service_table|
    # table is a Cucumber::MultilineArgument::DataTable
    
    all_service_table.hashes.each do |service|
        
        # each returned element will be a hash whose key is the table header.
        # you should arrange to add that movie to the database here.
        AllService.create!(service)

    end
end
  
  Then /"(.*)" seed services should exist/ do | n_seeds |
    puts AllService
    AllService.count.should be n_seeds.to_i
  end
  
  # Scenario 1: Customer clicks on Cash Category
  Given /I visit "(.+)"$/ do |page_name|
    visit page_name
  end


  When /I click on the "(.*)" of "(.*)"$/ do |l1, l2|
    # byebug
    page.click_link l2
    # byebug
    if (l1 == "service") 
      #byebug
      id = AllService.where(:service => l2)[0].id
      @migratable = AllService.where(:id => id)[0].migratable
      
      #visit "/services/#{id}/time_estimate?migratable=#{@migratable}"
      # byebug
    end
  end
  
  # Then('I should be on the Account Opening page') do
  #   pending # Write code here that turns the phrase above into concrete actions
  # end

  Then(/^I should see "(.*)" services on "(.+)"/) do |number, category|
    services = AllService.where(:category => category)
    expect(services.count).to eq number.to_i
  end
  

# Scenario 2: Customer uses a (QR Code) link to access the One-Stop Service page 
  
  # When /I visit "(.+)"$/ do |page_name|
  #   visit page_name
  # end


  Then(/^I should see the headers "(.*)"/) do |header_list|
    headers = header_list.split(", ")
    headers.each do |header|
      expect(page).to have_content header
    end
    #   if @migratable == "True" 
    #     expect(page).to have_content string
    #   end
    #   expect(page).to have_content string2
  end

  
  And(/^I should not see the headers "(.*)"/) do |header_list|
    headers = header_list.split(", ")
    headers.each do |header|
      expect(page).to_not have_content header
    end
    # if @migratable == "True" 
    #   expect(page).to_not have_content string
    # end
  end
# Scenario 3: Customer clicks on a Top Service and is redirected to the Time-Estimate page\
