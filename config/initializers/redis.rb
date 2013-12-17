
redis_uri = YAML.load_file("#{Rails.root}/config/redis.yml")[Rails.env] #[ENV['RAILS_ENV']]
uri = URI.parse(redis_uri)
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)