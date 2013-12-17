
redis_uri = YAML.load_file("#{Rails.root}/config/redis.yml")[Rails.env]
uri = URI.parse(redis_uri)
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)