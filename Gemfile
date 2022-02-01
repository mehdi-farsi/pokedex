# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'rails', '~> 7.0.1'
gem 'pg', '~> 1.1'
gem 'puma'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootsnap', require: false

# API serialization
gem 'jsonapi-serializer', '~> 2.2'

# Search & pagination
gem 'ransack', '~> 2.5'
gem 'will_paginate', '~> 3.3', '>= 3.3.1'

# Command-line progress-bar
gem 'progress_bar', '~> 1.3', '>= 1.3.3'

# Business-logic
gem 'interactor', github: 'collectiveidea/interactor'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.19'

  # Linting
  gem 'rubocop-rails', '~> 2.13'
  gem 'rubocop-rspec', '~> 2.6'
end

group :test do
  gem 'rspec-rails', '~> 5.0'
  gem 'database_cleaner-active_record', '~> 2.0', '>= 2.0.1'
end
