class PostRequest < DoRequest

	def headers
		headers = { "Content-Type" => "application/json", "Accept" => "application/json" }
		headers["Cookie"] = @cookies unless @cookies.nil?
		headers
	end

	private

	def exec_request
		res = http_request.post(@uri, @params.to_json, headers)
		res
	end

end
