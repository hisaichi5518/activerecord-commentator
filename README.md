# ActiveRecord::Commentator

ActiveRecord::Commentator adds `caller_location` (filename, line-number and method-name) as SQL comment that invokes SQL statement.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-commentator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-commentator

## Usage

### in Rails app

```ruby
# in config/initializers/commentator.rb
require "active_record/commentator"

ActiveRecord::Commentator::Configuration.paths = [
  /#{Rails.root.join("app").to_s}|#{Rails.root.join("lib").to_s}/
]
ActiveRecord::Base.connection.class.prepend(ActiveRecord::Commentator)
```

### Start server and visit localhost:3000

```
bundle exec rails server
```

## Rails application log

```
# execute sql at model
(0.3ms)  SELECT  `favorites`.`product_id` FROM `favorites` /* /Users/hisaichi5518/projects/github.com/sample/app/models/product.rb:28:in `block in <class:Product>' */

# execute sql at view
Info Load (0.5ms)  SELECT  `infos`.* FROM `infos` /* /Users/hisaichi5518/projects/github.com/sample/app/cells/infos/index.html.erb:3:in `_app_cells_infos_index_html_erb___2113458239111152552_70242821135200' */
```

## Database slow log

```
# Time: 198723 23:21:34
# User@Host: ... @ localhost []
# Query_time: 1.90872  Lock_time: 0.90879 Rows_sent: 1  Rows_examined: 9802714
...
SELECT  `favorites`.`product_id` FROM `favorites` /* /Users/hisaichi5518/projects/github.com/sample/app/models/product.rb:28:in `block in <class:Product>' */
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hisaichi5518/activerecord-commentator.
