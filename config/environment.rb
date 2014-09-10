# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Brogramming::Application.initialize!


SETUP_PROC = lambda do |env|
  env['omniauth.strategy'].options[:consumer_key] = ENV['GITHUB_KEY']
  env['omniauth.strategy'].options[:consumer_secret] = ENV['GITHUB_SECRET']

	ENV['GITHUB_KEY'] = "1d52b374df24f99948f5"
	ENV['GITHUB_SECRET'] = "60372051ae937565c260ee9b234ac2103436492e"
end
