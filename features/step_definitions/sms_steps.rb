Given /I am using "(.*)"/ do |user_agent|
  case user_agent   
  when "iPhone"
    page.driver.header('user-agent', 'Mozilla/5.0 (iphone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile 15E148 Safari/604.1')
  when "Android"
    page.driver.header('user-agent', 'Mozilla/5.0 (Linux; Android 10; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.162 Mobile Safari/537.36')
  else
    # includes web
    page.driver.header('user-agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36')
  end
end

When(/I select "(.*)"/) do |branch_name|
    page.select branch_name
  end

Then(/I should see a QR with "(.*)"/) do |qr|
    expect(page.find(:xpath, "//figure[contains(@class, 'center')]/a")["href"]).to eq qr
end
