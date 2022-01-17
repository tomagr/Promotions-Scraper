class GetRequest < DoRequest

  private

  def headers
    { 'Content-Type' => 'application/json' }
  end

  def exec_request
    res = http_request.get(@@parsed_uri.request_uri, @headers)
    res.body
  end

end
