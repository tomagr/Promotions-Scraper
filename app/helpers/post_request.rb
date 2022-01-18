class PostRequest < DoRequest

	def headers
		headers = { "Content-Type" => "application/x-www-form-urlencoded" }
		headers["Cookie"] = @cookies unless @cookies.nil?
		headers
	end

	private

	def exec_request
		encoded_form = URI.encode_www_form(@params)
		res = http_request.request_post(@uri, encoded_form, headers)
		res
	end

end
