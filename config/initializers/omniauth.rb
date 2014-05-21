OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'fc775cd0295fc39cd450', '7ac93d1c9742f2161e7e9dde56c11a4999dea4f9', scope: 'user:email'
  provider :facebook, '636805493067767', 'c6d023c2728ad1bff101100b66756c6e'
end