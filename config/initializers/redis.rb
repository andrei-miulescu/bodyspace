
redis_uri = YAML.load_file("#{Rails.root}/config/redis.yml")[Rails.env]
uri = URI.parse(Figaro.env.redis_url)
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)