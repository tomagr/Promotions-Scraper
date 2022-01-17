require "uri"
require "net/http"
require 'cgi'

class DoRequest < BaseInteractor

	def self.to(uri:, params: nil, cookies: nil)
		new(uri: uri, params: params, cookies: cookies).execute
	end

	def self.get_body(uri:)
		request = self.to(uri: uri)
		request.body
	end

	def initialize(uri:, params:, cookies:)
		@uri = uri
		@headers = headers
		@params = params
		@cookies = cookies
	end

	def execute
		validate_uri
		validate_headers
		exec_request
	end

	def http_request
		@@parsed_uri = @uri.is_a?(URI) ? @uri : URI.parse(@uri)
		http = Net::HTTP.new(@@parsed_uri.host, @@parsed_uri.port)
		http.use_ssl = use_ssl
		http
	end

	def use_ssl
		@uri.is_a?(URI) ? @uri.scheme == "https" : @uri.include?("https://")
	end

	private

	def validate_uri
		invalid "uri", "The uri is not valid" if @uri.blank?
	end

	def validate_headers
		invalid "headers", "The headers are invalid" if @headers.blank? or !@headers.kind_of? Hash
	end

end
