#Background
Given('the following categories exist:') do |all_service_table|
  # table is a Cucumber::MultilineArgument::DataTable
  all_service_table.hashes.each do |service|
    AllService.create!(service)
  end
end
  
Then /"(.*)" seed services should exist/ do | n_seeds |
  AllService.count.should be n_seeds.to_i
end

Given('the following branches exist:') do |branch_table|
  # table is a Cucumber::MultilineArgument::DataTable
  branch_table.hashes.each do |branch|
    Branch.create!(branch)
  end
end
Then /"(.*)" seed branches should exist/ do | n_seeds |
  Branch.count.should be n_seeds.to_i
end
  

Given('I am using web') do
  page.driver.header('user-agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36')
end

  # Scenario 1: Customer clicks on Cash Category
  Given /I visit "(.+)"$/ do |page_name|
    visit page_name
  end

  When /I click on the "(.*)" of "(.*)"$/ do |l1, l2|
    page.click_link l2
    if (l1 == "service") 

      id = AllService.where(:service => l2)[0].id
      @migratable = AllService.where(:id => id)[0].migratable
    end
  end

  Then(/^I should see "(.*)" services on "(.+)"/) do |number, category|
    services = AllService.where(:category => category)
    expect(services.count).to eq number.to_i
  end
  

# Scenario 2: Customer uses a (QR Code) link to access the One-Stop Service page 

  Then(/^I should see the headers "(.*)"/) do |header_list|
    headers = header_list.split(", ")
    headers.each do |header|
      expect(page).to have_content header
    end
  end

  
  And(/^I should not see the headers "(.*)"/) do |header_list|
    headers = header_list.split(", ")
    headers.each do |header|
      expect(page).to_not have_content header
    end
  end


  When (/I click on the "(.*)" button/) do |button_name|
    click_button button_name
  end