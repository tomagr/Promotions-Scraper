source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'ed25519'
gem 'bcrypt_pbkdf'

ruby '3.0.2'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use Puma as the app server
gem 'puma'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use jquery as the JavaScript library
# gem 'jquery-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'


# Generate Settings files, url: https://github.com/railsconfig/config
gem 'config'

# Auto schema in models, url: https://github.com/ctran/annotate_models
gem 'annotate'

# For user model, url: https://github.com/plataformatec/devise
gem 'devise'

# Active admin, url: https://github.com/activeadmin/activeadmin
gem 'activeadmin'

gem 'mimemagic'

# url: https://github.com/activeadmin-plugins/active_material
gem 'active_material'

gem 'nokogiri'

# For the js runtime
gem 'execjs'
gem 'therubyracer', platforms: :ruby

#Cron Job
gem 'whenever', :require => false

gem 'listen', '~> 3.0.5'

gem 'mysql2', '~> 0.5.3'

group :development, :test do
	gem 'byebug'
	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
	gem 'spring'
	gem 'rexml'

	# Error log
	gem 'better_errors'
	gem 'fuubar'

	gem 'pry'
	gem 'pry-rails'
end

group :development do
	gem 'web-console', '>= 4.1.0'
	gem 'spring-watcher-listen', '~> 2.0.0'
end


group :test do
	gem 'capistrano'
	gem "capistrano3-puma", "5.2.0" # For deploy instructions https://www.rubydoc.info/gems/capistrano3-puma
	gem 'capistrano-bundler', require: false
	gem 'capistrano-rails'
	gem 'capistrano-rvm'
	gem 'capistrano-secrets-yml', require: false

	gem 'shoulda-matchers', '~> 3.1'
	gem 'rspec-rails'
	gem 'rspec-collection_matchers'

	gem 'simplecov'
	gem 'factory_bot_rails'
	gem 'json_matchers'
	gem 'rubycritic'
end
