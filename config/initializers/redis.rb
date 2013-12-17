
uri = URI.parse(Figaro.env.redis_url)
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)