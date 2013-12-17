source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'pg'
gem 'rolify'
gem 'sendgrid'
gem 'simple_form'

## Assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'timelineJS-rails', github: 'andrei-miulescu/timelineJS-rails', ref: 'b502b56889b82c73970a23ce81811de74179e3d9'
gem 'bootstrap-generators', '~> 3.0'
gem 'underscore-rails'
gem 'modernizr-rails'

#image uploads
gem 'paperclip', '~> 3.0'
gem 'aws-sdk', '~> 1.5.7'

#scraping

gem 'mechanize', '~> 2.7.2'


gem 'ruby-units'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'thin'
end
group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end
