source 'https://rubygems.org'
ruby '2.3.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.9'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '3.2.0.0'
gem 'uglifier'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# gem 'geocoder'
gem 'puma'

gem 'countries'

gem 'pg', '0.17.1'
gem 'searchkick', '~> 3'

gem 'resque'
gem 'resque-scheduler'

gem 'paperclip', '~> 4.3', '>= 4.3.7'
# gem 'aws-sdk', '~> 2.3.0'
gem 'aws-sdk', '< 2.0'
gem "lograge"


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec', '~> 3.7'
  gem 'factory_girl_rails', require: false
  gem 'spring'
  gem 'shoulda'
  gem 'faker'
  gem 'pry'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end
