Given('the following categories exist:') do |all_service_table|
    # table is a Cucumber::MultilineArgument::DataTable
    
    all_service_table.hashes.each do |service|
        
        # each returned element will be a hash whose key is the table header.
        # you should arrange to add that movie to the database here.
        AllService.create!(service)

      end
  end
  
  
  
  Then /(.*) seed services should exist/ do | n_seeds |
    puts AllService
    AllService.count.should be n_seeds.to_i
  end
  

  
  # Then('I should be on the Account Opening page') do
  #   pending # Write code here that turns the phrase above into concrete actions
  # end

  Then(/^I should see (.*) services on "(.+)"/) do |number, category|
    services = AllService.where(:category => category)
    expect(services.count).to eq number.to_i
  end


  