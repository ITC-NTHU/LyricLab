# frozen_string_literal: true

source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

# Configuration and Utilities
gem 'figaro', '~> 1.2'
gem 'pry'
gem 'rake'

# PRESENTATION LAYER
gem 'slim', '~> 5.0'

# gpt language
gem 'rest-client', '~> 2.1'
gem 'ruby-openai', '~> 6.3'

# APPLICATION LAYER
# Web application related
gem 'logger', '~> 1.6'
gem 'multi_json', '~> 1.15'
gem 'ostruct', '~> 0.0'
gem 'puma', '~> 6.0'
gem 'rack-cache'
gem 'rack-session', '~> 0.3'
gem 'roar', '~> 1.0'
gem 'roda', '~> 3.0'

# Controllers and services
gem 'dry-monads', '~> 1.4'
gem 'dry-transaction', '~> 0.13'
gem 'dry-validation', '~> 1.7'

# DOMAIN LAYER
# Validation
gem 'dry-struct', '~> 1.6'
gem 'dry-types', '~> 1.7'

# INFRASTRUCTURE LAYER
# Networking
gem 'http', '~> 5.2.0'

# Word Processing
gem 'csv'
gem 'rexml', '>= 3.3.9'
gem 'tradsim'

# Security
gem 'rbnacl'

group :development, :test do
  gem 'roo'
end

group :production do
  gem 'pg', '~> 1.2'
end

# Testing
group :test do
  gem 'minitest', '~> 5.20'
  gem 'minitest-rg', '~> 5.2'
  gem 'simplecov', '~> 0'
  gem 'vcr', '~> 6'
  gem 'webmock', '~> 3'

  # Acceptance Tests
  gem 'headless', '~> 2.3'
  gem 'page-object', '~> 2.0'
  gem 'selenium-webdriver', '~> 4.11'
  gem 'watir', '~> 7.0'
end

# Development
group :development do
  gem 'flog'
  gem 'reek'
  gem 'rerun'
  gem 'rubocop'
  gem 'rubocop-minitest'
  gem 'rubocop-rake'
  gem 'rubocop-sequel'
  gem 'ruby-lsp'
end
