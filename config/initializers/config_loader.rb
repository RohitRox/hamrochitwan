if Rails.env.production?
    APP_CONFIG = {
      site_name: "HamroChitwan",
      cl_cloud_name: ENV['CL_CLOUDNAME'],
      cl_apikey: ENV['CL_APIKEY'],
      cl_apisecret: ENV['CL_APISECRET']
    }
    APP_CONFIG.symbolize_keys!
else
    APP_CONFIG =  YAML.load_file("#{Rails.root}/config/app_config.yml")[Rails.env].symbolize_keys
end

Cloudinary.config do |config|
  config.cloud_name = APP_CONFIG[:cl_cloudname]
  config.api_key = APP_CONFIG[:cl_apikey]
  config.api_secret = APP_CONFIG[:cl_apisecret]
  config.cdn_subdomain = true
end