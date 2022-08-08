# Database Setup

Setting up the SQL database consists of 2 steps: migrating and seeding. Migrating creates the schema, dictating the structure of the SQL tables, such as the column headers. Seeding populates the tables with data from seed files such as CSV files.

## Migration
To make any changes to the schema, always create a new migration rather than changing schema.rb directly. 

    rails g migration [Descriptive name of the changes] 

Official [documentation](https://guides.rubyonrails.org/active_record_migrations.html) on migration.
## Seeding
When rails db:seed is run, rake (a ruby task automator built into Rails 5) automatically runs the file seeds.rb. It reads a CSV file and for each specified column, the create method inherited from ActiveRecord::Base is called on the model. Hence, the model attributes should match the columns specified in seeds.rb.

