require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { :size => 1, :url => 'redis://redis-app20223279:JRr0tLrDk1S7BBaw@pub-redis-16622.us-east-1-2.3.ec2.garantiadata.com:16622', :namespace => 'mynamespace' }
end

Sidekiq.configure_server do |config|
  # The config.redis is calculated by the
  # concurrency value so you do not need to
  # specify this. For this demo I do
  # show it to understand the numbers
  config.redis = { :size => 9, :url => 'redis://redis-app20223279:JRr0tLrDk1S7BBaw@pub-redis-16622.us-east-1-2.3.ec2.garantiadata.com:16622', :namespace => 'mynamespace' }
end