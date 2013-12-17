require 'sidekiq'

redis_uri = YAML.load_file("#{Rails.root}/config/redis.yml")[Rails.env]

Sidekiq.configure_client do |config|
  config.redis = { :size => 1, :url => redis_uri, :namespace => 'mynamespace' }
end

Sidekiq.configure_server do |config|
  # The config.redis is calculated by the
  # concurrency value so you do not need to
  # specify this. For this demo I do
  # show it to understand the numbers
  config.redis = { :size => 9, :url => redis_uri, :namespace => 'mynamespace' }
end