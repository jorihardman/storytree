Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = '/storytree/auth' if RAILS_ENV == 'production'
  end

  provider :facebook, '190218187668785', 'f83fe7be594b90e016ac4dbaaeeb489b', {:scope => 'publish_stream'}
end
