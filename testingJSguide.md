# Testing JavaScript with Cucumber, Capybara, Rails, Rack Test, Selenium

## Background

We have a search bar that suggests related terms powered by Flask and Machine Learning, which we are integrating into a Rails app. Our particular testing suite uses Cucumber and Capybara.

## Capybara + Selenium
By default, Capybara uses `rack_test`, which does not support testing of JS functions. To run JS in browser with Capybara, you can use Selenium. There are many guides for Capybara + RSpec that depict changing `test_helper.rb` in the spec directory, but if you're not using RSpec, that doesn't work. 

## Capybara + Cucumber + Selenium 
For Capybara + Cucumber, `features/support/env.rb` can be configured to use other drivers. In our case, scenarios/tests with `@javascript` (or any @tag) were configured to use Selenium right before they were run. It's important to also undo it by for other scenarios by configuring `not @javascript` to use the default drivers. See the following:
```ruby
    # features/support/env.rb
    
    # other configuration code such as DatabaseCleaner...
    Before('@javascript') do
        # { except: [:widgets] } may not do what you expect here
        # as Cucumber::Rails::Database.javascript_strategy overrides
        # this setting.
        DatabaseCleaner.strategy = :truncation
        # Use non headless option if you want to see Capybara Selenium acting in a browser window
        # Capybara.current_driver = :selenium_chrome
        Capybara.current_driver = :selenium_chrome_headless
    end

    Before('not @javascript') do
        DatabaseCleaner.strategy = :transaction
        Capybara.use_default_driver 
    end
```
You should also add the `@javascript` tag in front of the scenario in the relevant `.feature` file. For example:
```Gherkin
    # features/searchbar.feature


    # some background is setup beforehand...
    @javascript
    Scenario: Customer keys in matching search terms (autocomplete)
    Given I type in "Update" into the search bar
    Then I should see "Update Phone" in the dropdown
    When I click on the "Update Phone" in the dropdown
    Then I should see the headers "Update Phone, Do it digitally, Do it at a branch"
```
With this, you should be able to test JS functions in browser along with external services or API.