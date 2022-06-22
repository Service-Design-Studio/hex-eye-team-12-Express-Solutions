## Github

Co-authoring _add 2 lines form the first line in your message first)_

    Co-Authored-By: Ke Wei <yeokewei@users.noreply.github.com>
    Co-Authored-By: Subesh <pinkadotted@users.noreply.github.com>
    Co-Authored-By: Joshua <brutatoasta@users.noreply.github.com>
    Co-Authored-By: Jeff Lai <Jefflai0315@users.noreply.github.com>    
    Co-Authored-By: Jowie <spizzray@users.noreply.github.com>  



Git pull [error](https://www.datree.io/resources/git-error-fatal-refusing-to-merge-unrelated-histories) on VSCode (when you have unrelated branches):

    git pull origin master -allow-unrelated-histories

Git [undoing](https://stackoverflow.com/questions/22682870/how-can-i-undo-pushed-commits-using-git) commits!



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