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
    #expect(page.select).to have_content branch
    # expect(find_field('branch_selector').value).to be branch
    # page.find(:xpath, "//figure[contains(@class, 'center')]/a")["href"]
    expect(page.find(:xpath, "//select[contains(@id, 'branch_name')]").value).to eq branch
    # expect(page).to have_select(id:'branch_selector', selected: branch)
    # puts page.body
    
    # find("#branch_selector option[value='#{branch}']").should be_selected
    # expect(page.find_by_id('branch_selector')).to have_content(branch)
  end
