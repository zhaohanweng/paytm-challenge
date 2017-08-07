module ResponseHelpers
  def response_json
    @_json ||= Hashie::Mash.new(JSON.parse(response.body))
  end
end
