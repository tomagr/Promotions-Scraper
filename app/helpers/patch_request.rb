class PatchRequest < DoRequest

	def headers
		{"Content-Type" => "application/json", "Accept" => "application/json"}
	end

	private
  def exec_request
		res = http_request.patch(@uri, @params.to_json, headers)
    res
  end

end
