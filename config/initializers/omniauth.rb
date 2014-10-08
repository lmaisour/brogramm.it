# OmniAuth.config.full_host = "http://brogramit.herokuapp.com/"
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end
