## Github


Git pull [error](https://www.datree.io/resources/git-error-fatal-refusing-to-merge-unrelated-histories) on VSCode (when you have unrelated branches):

    git pull origin master -allow-unrelated-histories 

## Db-related

Creating initial Database schema

    bundle exec rails db:migrate
    bundle exec rails db:seed

Check for pending migrations and load the test schema

    bundle exec rails db:test:prepare

Empty the test database

    bundle exec rails db:test:purge

## RSpec
Generates rails_helper and spec_helper in "Spec"
Requires *gem rspec-rails* in GEMFILE

    rails generate rspec:install



[Markdown Guide](https://agea.github.io/tutorial.md/)