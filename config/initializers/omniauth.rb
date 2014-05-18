OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['636805493067767'], ENV['c6d023c2728ad1bff101100b66756c6e']
end