Given('the following topics exist:') do |topics_table|
    # table is a Cucumber::MultilineArgument::DataTable
    topics_table.hashes.each do |topic|
      Topic.create!(topic)
    end
  end
  
  Then /"(.*)" seed topics should exist/ do | n_seeds |
    Topic.count.should be n_seeds.to_i
  end


  Then (/I should see "(.*)" pre-selected for branch/) do | branch |
    expect(page.find(:xpath, "//select[contains(@id, 'branch_name')]").value).to eq branch
  end
