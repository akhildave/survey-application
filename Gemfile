source 'https://rubygems.org'

ruby '2.1.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.3'


# Use Postgres
gem 'pg'
# Required for Heroku Rails 4
#gem 'rails_12factor'
# Upload to AWS
gem "aws-sdk"

# warden 1.2.2 required for rails-api
#gem 'warden', '1.2.2'
# Authentication
gem 'devise'
#gem 'devise_header_token'

# Admin interface for rails 4.1
# rails g active_admin:install [--skip-users](when using custom user)
#gem 'activeadmin', github: 'gregbell/active_admin'
# Multiple languages
# Don't forget to include :id on permit params
gem 'globalize', '~> 4.0.3'
gem 'globalize-accessors', '~> 0.1.5'
gem 'batch_translations'
#gem "activeadmin-globalize", github: 'stefanoverna/activeadmin-globalize', branch: 'master'

# File uploads and rich text format on input
#gem 'fog'
#gem 'activeadmin-dragonfly', github: 'stefanoverna/activeadmin-dragonfly'
#gem 'activeadmin-wysihtml5', github: 'stefanoverna/activeadmin-wysihtml5'

# friendly_id and SEO with activeadmin
# gem 'activeadmin-seo', github: 'nebirhos/activeadmin-seo', branch: 'master'

# Use paperclip to attach files
gem "paperclip", "~> 4.1"

# Friendly url's
gem 'friendly_id', '~> 5.1.0'
# Friendly_id with globalize
gem 'friendly_id-globalize', github: 'norman/friendly_id-globalize'
# Routes translation
gem 'route_translator'

# Send mail directly from form
gem 'mail_form'
# Easy forms
# rails generate simple_form:install
gem 'simple_form'

# Pagination
gem 'will_paginate'

group :development, :test do
  # Useful generators
  # gem 'nifty-generators'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
	#
  # Quiet assets logging
  gem  'thin'
  gem 'quiet_assets'
	# Open email directly in the browser (without sending to original destination)
	gem 'letter_opener'
  # Useful notes for debugging views
  # rails generate rails_footnotes:install
  gem 'rails-footnotes'
	# Better console for debugging
	gem 'pry-rails'
	# Run live tests with guard
	# guard init rspec
	# guard (in case of problems, run with bundle exec)
	gem 'guard'
	# Run guard with rspec configs
	gem 'guard-rspec', require: false
	# Server for tests
	gem 'spork-rails', github: 'sporkrb/spork-rails' # rubygems version not rails 4 compatible
	gem 'guard-spork'
	# Show test results on Mac notifications
	gem 'terminal-notifier-guard'
end


group :test do
	# Write tests with rspec
	# rails generate rspec:install
	gem 'rspec-rails'
	# Generate test models
	gem 'factory_girl_rails'
end



# Scan code for security issues
gem 'brakeman', :require => false

# Useful CSS/SASS tools
gem 'compass-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
#gem 'therubyracer'
#gem 'bootstrap-sass'
gem 'sass'

#bootstrap v3.2
gem "twitter-bootstrap-rails"

gem "kaminari"
gem "ransack"
gem "dynamic_form"

#required to generate only scaffold inside namespace. 
gem 'rails-admin-scaffold'

#gem 'formtastic','2.2.0'
#gem 'surveyor', :git => 'git://github.com/ferrisoxide/surveyor.git'
gem 'surveyor', github: 'NUBIC/surveyor'
gem 'surveyor_gui', :github => "kjayma/surveyor_gui"
#gem 'surveyor_gui'
#gem 'formtastic-bootstrap'

gem 'rails-i18n', '~> 4.0.0'
gem 'i18n-country-translations'
gem 'i18n_country_select'
#to select languages with code, ISO Gem
gem 'iso'
#Manage roles

#base api
#gem 'rails-api'
gem 'devise-token_authenticatable', '0.3.0'

gem 'rabl'
#gem 'cancancan', '~> 1.10'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

