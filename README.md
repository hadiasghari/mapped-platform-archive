[![Coverage Status](https://coveralls.io/repos/github/hadiasghari/MAPPED/badge.svg?branch=develop)](https://coveralls.io/github/hadiasghari/MAPPED?branch=develop)
![Build status](https://travis-ci.org/hadiasghari/MAPPED.svg?branch=develop)

# MAPPED

MAPPED is a platform that helps citizens to send access requests to organizations. An access request is a request by a citizen to receive from an organization (information about) the personal data that that organization is processing in relation to him/her. The right to receive a swift, complete and understandable answer to such a request, called right of access, is guaranteed under European law in order to promote citizen empowerment.

This README documents steps that are necessary to set the development environment for application up and running.

# Ruby version

We are using the latest stable version of Ruby 2.3. You can install Ruby version using [rvm](https://rvm.io).

# System dependencies

This steps should work on macOS and different distros of Linux as well as other Unix based operating systems.

Install bundler if it's not already installed:

`gem install bundler`

Go to the root directory of project and run:

`bundle install`

# Configuration

Define DB_USERNAME and DB_PASSWORD environment variables to make config/database.yml work.
We are using PostgreSQL 9.6.5 and some specific PostgreSQL features like JSONB.

Generate a random key using irb:
`SecureRandom.base64(64)`

and export the key `MAPPED_TOTP_ENCRYPTION_KEY` with the above value. for example:

`export MAPPED_TOTP_ENCRYPTION_KEY='UWsV8/Lz3Dr4qmQHNKGxj885nWt0+BETAZrbvsV/21yH5RC/7MBlW2fxB3tP97PyH5ryen/ZV1uoBQHhPCDWPg=='`

Instead of exporting all these environment variables, you can also create a config/local_env.yml file and define all these variables in there. This file is in .gitignore and will not pushed into Git.

# Database creation and initalization

`bundle exec rake db:setup`

# How to run the test suite

Tests are using simplecov and Coverall to generate coverage reports, before running tests make sure that you have a .coveralls.yml file with correct repo_token in it, for security reasons .coveralls.yml is not included in source control.

`bundle exec rake test`

# Enabling Git pre-hooks for CI

`pre-commit install`

This creates a .git/hooks/pre-commit script which will check your git config and run checks that are enabled. For list of enabled pre-commit hooks checkout config/pre_commit.yml file.

# Deployment instructions

Deployments are done using Heroku, any push to master branch will trigger a deploy to Heroku.
