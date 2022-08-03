#Background
require 'csv'
Given /the data in branch.csv/ do 
    bank_details_table = CSV.read("db/branch.csv")
    bank_details_table.each do |bank, branch_name, branch, sms_number, wait_time|
        Branch.create!(:bank => bank, :branch_name => branch_name,:branch => branch, :sms_number => sms_number, :wait_time => wait_time)
    end
end

And /I should see the branch time estimate with "(.*)"/ do |est|
    # //*[@id="branchtime"]
    #https://www.guru99.com/xpath-selenium.html
    expect(page.find(:xpath, ".//b[contains(@id , branchtime)]").text).to eq est
end

And /I should not see the branch time estimate with "(.*)"/ do |est|
    expect(page.find(:xpath, ".//b[contains(@id , branchtime)]").text).to_not eq est
end

When /I select the branch of "(.*)" in the dropdown/ do| branch |
    #https://www.guru99.com/xpath-selenium.html
    find(:xpath, "(//option[@value='#{branch}'])").click
end