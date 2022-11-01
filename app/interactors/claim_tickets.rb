class ClaimTickets < BaseInteractor

	def self.for(entry:)
		new(entry: entry).execute
	end

	def initialize(entry:)
		@entry = entry
	end

	def execute
		invalid_entry @entry
		claim_tickets
	end

	private

	def claim_tickets
		response = PostRequest.to(uri: uri(endpoint), params: params, cookies: cookies)
		parse_response response
		console_log "Claim response: #{response}"
		response
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

	def tickets_url
		"https://experienciasblack.lanacion.com.ar/"
	end

	def endpoint
		"experiencia/canjear/" + @entry.site_id.to_s
	end

	def uri endpoint
		URI.parse(tickets_url + endpoint)
	end

	def cookies
		"tieneClub=0; PHPSESSID=#{phpsessid}; token=#{token}; cookieLogin=#{cookie_login}; usuarioDetalleClubNacion=B; usuarioemail=smacagno@gmail.com; ProductoPremiumId=2,3,4,5; usuario%5Fid=3104118; usuario%5Fdetalle%5Fnick=smacagno; usuario%5Fdetalle%5Fguid={30A797D7-6096-46C9-830A-EA2491AA41D8}; usuario%5Fusuario=smacagno; Crm_id=A00624459; gaComboType=ga-combo3;"
	end

	def phpsessid
		'58k2h1ukt966d5436urtq6m0t6'
	end

	def gid
		'GA1.3.918545336.1665970354'
	end

	def cookie_login
		"usuario%5Fid=3104118&estado_id=1&nacimiento=&usuario_facebook_id=10210999721403518&usuario_gmail_id117360688670536991880"
	end

	def token
		"30A797D7-6096-46C9-830A-EA2491AA41D8"
	end

	def username
		'smacagno'
	end

	def params
		{ "telephone": "1164371621" }
	end

end


