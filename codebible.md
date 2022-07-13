n## Github

Commits Co-authoring _(add them 2 lines below the first line of your commit message )_

    Co-Authored-By: Ke Wei <yeokewei@users.noreply.github.com>
    Co-Authored-By: Subesh <pinkadotted@users.noreply.github.com>
    Co-Authored-By: Joshua <brutatoasta@users.noreply.github.com>
    Co-Authored-By: Jeff <Jefflai0315@users.noreply.github.com>    
    Co-Authored-By: Raymond <spizzray@users.noreply.github.com>  
    Co-Authored-By: Jowie <ioitami@users.noreply.github.com>  

Fetches main into your current working branch [?](https://stackoverflow.com/questions/52108832/what-is-the-difference-between-git-pull-and-git-pull-origin-master)
```
git pull origin main
```

Git pull [error](https://www.datree.io/resources/git-error-fatal-refusing-to-merge-unrelated-histories) on VSCode (when you have unrelated branches):
```
git pull origin main -allow-unrelated-histories
```

## Db-related

Creating initial Database schema
```
bundle exec rails db:migrate
bundle exec rails db:seed
```

Check for pending migrations and load the test schema
```
bundle exec rails db:test:prepare
```
Empty the test database
```
bundle exec rails db:test:purge
```

## RSpec
Generates rails_helper and spec_helper in "Spec"
Requires *gem rspec-rails* in GEMFILE

    rails generate rspec:install

## Cucumber
Running Cucumber for a specific feature file
```
bundle exec cucumber features/all_services.feature
```
## Markdown
[Markdown Guide](https://agea.github.io/tutorial.md/)



Resources:

[Rails redirecting invalid route to root](https://stackoverflow.com/questions/6548928/rails-redirecting-invalid-route-to-root)

[Gem browser](https://github.com/fnando/browser)