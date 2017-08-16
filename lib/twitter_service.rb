class TwitterService
  class << self
    def search(keyword, size = 10)
      size ||= 10
      client.search(keyword, result_type: "recent").take(size.to_i)
    end

    private

    def client
      Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['TWITTER_CONSUMER_KEY'] || 'Gy3o6gStIo1Y1nHILUvxYQxKv' # temporary token
        config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET'] || 'W1jlshSoZ4eLnqdOHHFMaAshXMibkCfHjEVWqhxZW65rI3Mz5b'
      end
    end
  end
end
