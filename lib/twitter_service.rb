class TwitterService
  class << self
    def search(keyword, size = 10)
      size ||= 10
      client.search(keyword, result_type: "recent").take(size.to_i)
    end

    private

    def client
      Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['TWITTER_CONSUMER_KEY'] || '5gZ1EGwQuRPGWruU5qbvmRE1L' # temporary token
        config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET'] || 'UXqZWK1RTaGLxSXrGz1buRGxJgQKrtJWkOiZMa3qL4eysouXCb'
      end
    end
  end
end
