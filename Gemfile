# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in day_offs.gemspec
gemspec

gem "rake", "~> 13.0"

group(:lint) do
  gem "rubocop", "~> 1.21"
end

group(:test) do
  gem "rspec", "~> 3.0"
  gem 'coveralls_reborn', require: false
end