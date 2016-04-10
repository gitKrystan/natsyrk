# Natsyrk.com

##### By Krystan Menne

Natsyrk automatically generates portfolio entries using the Github API.

## Prerequisites
* Ruby 2.2.2 or greater
* Rails 4.2.6 or greater
* PostgreSQL

## Installation
1. `$ git clone https://github.com/gitKrystan/natsyrk.git`
1. Change into the new directory
1. `$ bundle install`
1. Create database and run migrations
  1. `$ rake db:create`
  1. `$ rake db:migrate`
  1. `$ rake db:test:prepare`
1. Create your `.env` file. See sample at `.env_sample`
1. Run the tests (see below)

## Running / Development
1. `$ rails serve`
1. Visit your app at [http://localhost:3000](http://localhost:3000).

## Running Tests
`$ rspec`

## Adding Portfolio Entries
Natsyrk adds any starred repositories that you own to your portfolio site.
1. To add repos that you do not own but contribute to, you will need to fork the repo.
1. Add a branch called `natsyrk` with a `portfolio_entry.md` file in the root directory.
1. Star the repository.
1. Visit the admin page of your Natsyrk enabled site and click 'Update Entries From Github.'

## License
Copyright (c) 2016 Krystan Menne
This software is licensed under the MIT license.
