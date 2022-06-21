require 'uri'
require 'cgi'
# require File.expand_path(File.join(File.dirname(FILE), "..", "support", "paths"))
# require File.expand_path(File.join(File.dirname(FILE), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
    visit '/services'
    
  end

# When /^(?:|I )click on the "([^"]*)"$/ do |button|
#   click_button(button)
# end

When /I click on the "(.*)"/ do |locator|
  page.click_link locator
end