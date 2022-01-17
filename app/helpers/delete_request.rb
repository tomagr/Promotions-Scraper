class DeleteRequest < DoRequest

  private

  def headers
    { 'Content-Type' => 'application/json' }
  end

  def exec_request
    res = http_request.delete(@@parsed_uri.request_uri, @headers)
    res.body
  end

end
