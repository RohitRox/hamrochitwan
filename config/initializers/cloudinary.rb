Cloudinary.config do |config|
  config.cloud_name = APP_CONFIG[:cl_cloudname]
  config.api_key = APP_CONFIG[:cl_apikey]
  config.api_secret = APP_CONFIG[:cl_apisecret]
  config.cdn_subdomain = true
end