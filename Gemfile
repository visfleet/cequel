source 'https://rubygems.org'

gemspec

group :debug do
  gem 'byebug', '~> 2.7'
  gem 'pry', '~> 0.9'
end

group :development do
  gem 'rubocop', require: nil
end

gem 'racc', '~> 1.4', :platforms => :rbx
gem 'rubysl', '~> 2.0', :platforms => :rbx
gem 'psych', '~> 2.0', :platforms => :rbx

# Match the Rails 4.2 LTS used by the webapp; cequel 2.1.0's dirty tracking
# doesn't work with ActiveModel 5.2.
gem 'activemodel', '~> 4.2.0'
gem 'activesupport', '~> 4.2.0'
