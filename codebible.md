# Codebible
Document of useful code snippets and troubleshooting FAQ.

## Github

Commits Co-authoring _(add them 2 lines below the first line of your commit message )_

    Co-Authored-By: Ke Wei <yeokewei@users.noreply.github.com>
    Co-Authored-By: Subesh <pinkadotted@users.noreply.github.com>
    Co-Authored-By: Joshua <brutatoasta@users.noreply.github.com>
    Co-Authored-By: Jeff <Jefflai0315@users.noreply.github.com>    
    Co-Authored-By: Raymond <spizzray@users.noreply.github.com>  
    Co-Authored-By: Jowie <ioitami@users.noreply.github.com>  

Fetches main into your current working branch [?](https://stackoverflow.com/questions/52108832/what-is-the-difference-between-git-pull-and-git-pull-origin-master)

    git pull origin main


Git pull [error](https://www.datree.io/resources/git-error-fatal-refusing-to-merge-unrelated-histories) on VSCode (when you have unrelated branches):

    git pull origin main -allow-unrelated-histories

## Cucumber
Running Cucumber for a specific feature file

    bundle exec cucumber features/all_services.feature

## Steps to reset the db

1. Goto /db and delete:

        development.sqlite3
        schema.rb

2. Create initial Database schema

        bundle exec rails db:migrate
        bundle exec rails db:seed

3. Check for pending migrations and load the test schema

        bundle exec rails db:test:prepare

## Markdown
[Markdown Guide](https://agea.github.io/tutorial.md/)

## RSpec
Generates rails_helper and spec_helper in "Spec"
Requires *gem rspec-rails* in GEMFILE

    rails generate rspec:install

## SMS

    if session[:ios]
      body = "sms:/+65#{sms_number}/&body=Q #{service}"
    else
      body = "sms:+65#{sms_number}?&body=Q #{service}"
    end

## User Agent
For injecting or spoofing user agent in capybara steps

iPhone

    page.driver.header('user-agent', 'Mozilla/5.0 (iphone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile 15E148 Safari/604.1')

Android

    page.driver.header('user-agent', 'Mozilla/5.0 (Linux; Android 10; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.162 Mobile Safari/537.36')

Web

    page.driver.header('user-agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36')


## Deployment

### Dockerfile

Add:

    FROM ruby:2.7.6 AS rails-toolbox
    ENV SECRET_KEY_BASE= # put secret key
    RUN chmod u+x bin/rails

### Gemfile

Comment out:

    gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
    gem "debug", platforms: %i[ mri mingw x64_mingw ]
    
Move Gem into all groups:

    gem 'sqlite3', '~> 1.3' 

### secrets.yml

Add file from production branch.

### Others

Remove any .exe substrings, typically from 

    bin/rails
    bin/rake
    bin/setup

## Troubleshooting FAQ

If Cucumber features are failing but code works, check Cucumber feature background for missing Given tables, especially for nil searches.

## Resources

[Rails redirecting invalid route to root](https://stackoverflow.com/questions/6548928/rails-redirecting-invalid-route-to-root)

[Gem browser](https://github.com/fnando/browser)