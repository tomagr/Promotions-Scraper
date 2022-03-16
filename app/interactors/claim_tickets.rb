class ClaimTickets < BaseInteractor

	def self.for(entry_external_id:)
		new(entry_external_id: entry_external_id).execute
	end

	def initialize(entry_external_id:)
		@entry_external_id = entry_external_id
	end

	def execute
		validate_php_session_id
		claim_tickets
	end

	private

	def phpsessid
		AppConfig.where(slug: 'php_session_id').first&.value # <---- This ID needs to be updated - Fequency? Dunno
	end

	def validate_php_session_id
		invalid :php_session_id, 'The email provided must not be nil' if phpsessid.blank?
	end

	def claim_tickets
		response = PostRequest.to(uri: uri(endpoint), params: params, cookies: cookies)
		parse_response response
	end

	def parse_response response
		case response.code
			when "302"
				"302 - The requested resource has been temporarily moved to a different URI"
			else
				parse_response_html response
		end
	end

	def parse_response_html response
		html_text = Nokogiri::HTML(response.body)
		message = html_text.css('.blog-item-small-content')
		text = Rails::Html::FullSanitizer.new.sanitize(message.to_s)
		text.gsub(/\s+/, " ") || "Empty 200 response?"
	end

	def endpoint
		"experiencia/canjear/" + @entry_external_id.to_s
	end

	def uri endpoint
		URI.parse(tickets_url + endpoint)
	end

	def cookies
		"PHPSESSID=#{phpsessid}; cookieLogin=#{cookie_login}; usuario%5Flogtkn=#{flog_token}; usuario%5Fid=#{user_id}; usuario%5Fdetalle%5Fguid=#{usuario_detalle_guid}; usuario%5Fusuario=#{username};"
	end

	def cookie_login
		'usuario%5Fid=3104118&estado_id=1&nacimiento=&usuario_facebook_id=10210999721403518&usuario_gmail_id117360688670536991880'
	end

	def flog_token
		'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHBpcmVzIjoxNjUwNTEzNjM4LCJ1c2VyX2lkIjoiMzEwNDExOCIsImRpc3BsYXlfbmFtZSI6InNtYWNhZ25vIiwiZG9tYWluIjoibGEtbmFjaW9uLmZ5cmUuY28ifQ.DuOaP46RrokJ7AuzjDdeH8jz90n9aNGE970i6va3Ow4'
	end

	def user_id
		'3104118'
	end

	def usuario_detalle_guid
		'{E7AF682A-51EA-48C1-94D5-2D0245C71BE0}'
	end

	def username
		'smacagno'
	end

	def params
		{ "telephone": "1164371621" }
	end

end


