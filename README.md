# Browser ID Challenge

This application reads a CSV file of browser IDs and attempts to match them to common users. Benchmarking was done using both a 10 thousand and 100 thousand record CSV file. Both were processed in under 3 seconds on average on my machine so I believe this meets the requirement of working 'at scale'. If I were to spend more time on this I would incorporate Active Record into the models and implement a database to allow for querying and support of real life use scenarios.

### Prerequisites

Clone the repo and use [Bundler](https://bundler.io/) to install the dependencies.

```
git clone https://github.com/eking1082/browser_id_challenge.git
cd browser_id_challenge
gem install bundler
bundle install
```

### Running the application

Run `app.rb` with the path to the CSV file you would like to process. The CSV headers are expected to be formatted as `local id {number}`.

For example, you can process the test CSV file by running:

```
ruby app.rb tests/test.csv
```

### Running the tests

Simply use `rake test` to run all of the tests.
