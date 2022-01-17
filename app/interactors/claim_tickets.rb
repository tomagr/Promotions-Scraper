class ClaimTickets < BaseInteractor

	def self.for(entry_external_id:)
		new(entry_external_id: entry_external_id).execute
	end

	def initialize(entry_external_id:)
		@entry_external_id = entry_external_id
	end

	def execute
		claim_tickets
	end

	private

	def claim_tickets
		response = PostRequest.to(uri: uri(endpoint), params: params, cookies: cookies)
		# WIP - Make this work when available
		# byebug
		#
		JSON.parse(response.body)
	end

	def endpoint
		"experiencia/canjear/" + @entry_external_id.to_s
	end

	def uri endpoint
		URI.parse(tickets_url + endpoint)
	end

	def cookies
		'metering_arc_ab_testing={"inicio":"2020-09-23","group":"A"}; cX_S=ko8mb03h5sbtkiem; cX_P=ko8mb03jd6qzdfu8; cX_G=cx%3A2x8h6mmvnd55kj437lnc9u03f%3A38is6lnqfnkji; PHPSESSID=ql6bp1496hrm7ham3hvi7oeb23; _hjTLDTest=1; _hjid=dd490bdf-7f58-4bfd-b4aa-593d1fa6b444; fbm_169655146422657=base_domain=.lanacion.com.ar; apw_cache=abbb048f-6a66-442a-aa4e-9bc4e9ace3cc.1621310488.bAvTqA.AR.0...1621310488.0..0.ihFQXCI98O_ywewp8gjhNrQ0j5eeI-QjF992gNBsjQQ; OPTAW_gaCookie=GA1.3.715667288.1620047251; __gads=ID=a5ff4bc72b8fbf83:T=1624142751:S=ALNI_MYDkKLEJOPM0TrebH5P7jEOjdQb0A; metering_arc_counter=0; _gaexp=GAX1.3.vNTPE84jSGuMLT2rvckvPA.19060.1; ln-notification=false; metering_arc=entitlement=SUBSCRIBED.expiration=1650251067.h61D5wzLFm4YafYe8ynd9urMYItG0zHr9dejQ0mLhFQ=; _gid=GA1.3.628792933.1641844925; token=E7AF682A-51EA-48C1-94D5-2D0245C71BE0; xvalue=716e780d-2663-4a1c-83cf-915448207a06; LNPreferencias=0usuario%5Fid=3104118; cookieLogin=usuario%5Fid=3104118&estado_id=1&nacimiento=&usuario_facebook_id=10210999721403518&usuario_gmail_id117360688670536991880; syncLfLN=21/04/2022 01:00:38 a.m.; usuarioDetalleClubNacion=B; usuarioemail=smacagno@gmail.com; usuario%5Flogtkn=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHBpcmVzIjoxNjUwNTEzNjM4LCJ1c2VyX2lkIjoiMzEwNDExOCIsImRpc3BsYXlfbmFtZSI6InNtYWNhZ25vIiwiZG9tYWluIjoibGEtbmFjaW9uLmZ5cmUuY28ifQ.DuOaP46RrokJ7AuzjDdeH8jz90n9aNGE970i6va3Ow4; ProductoPremiumId=2,3,4,5; PersoTKN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiRUQ2MDkwOTk2MEIwNDhFREI2MzY4NDM0MDdDRjgyRkEiLCJpZF92ZXJpZmllciI6IkU3QUY2ODJBIiwiZXhwIjoxOTU3MjMzNjM4LCJpc3MiOiJsYW5hY2lvbi5jb20uYXIiLCJhdWQiOiJsbmRpZ2l0YWwifQ.ELO2J3X3Cfc5X-83Mew-s__ixBffeuQ6xERDS5C1pGY; usuario%5Fid=3104118; usuario%5Fdetalle%5Fnick=smacagno; usuario%5Fdetalle%5Fguid={E7AF682A-51EA-48C1-94D5-2D0245C71BE0}; usuario%5Fusuario=smacagno; Crm_id=A00624459; nvg18894=f6a71ef20a334493badca8f7009|0_12; gaComboType=ga-combo3; shouldrelogin=true; _parsely_visitor={%22id%22:%22pid=c1f5817a44395e5b917483425b204110%22%2C%22session_count%22:97%2C%22last_session_ts%22:1641924655636}; AMP_TOKEN=%24NOT_FOUND; propension=0; _dc_gtm_UA-621326-120=1; _dc_gtm_UA-621326-98=1; _ga_EXRLGM6KVR=GS1.1.1641939885.121.1.1641940117.10; _ga_F5K6E3M5PT=GS1.1.1641939885.57.1.1641940117.10; _ga=GA1.3.1445489040.1632459738; AWSALB=5BLJ3ydS90s0zF390XvR7NIjpr3ig8iwvpH54LOYJTihNNYT9s1bsaDN8SptFPoXc4BKsGjXVyVv/3cl6tK7HERMn3Os4DHXYt75QlcIQRszMmMUHyPXNcxIeXbB; AWSALBCORS=5BLJ3ydS90s0zF390XvR7NIjpr3ig8iwvpH54LOYJTihNNYT9s1bsaDN8SptFPoXc4BKsGjXVyVv/3cl6tK7HERMn3Os4DHXYt75QlcIQRszMmMUHyPXNcxIeXbB'
	end

	def params
		{ "telephone": 1164371621 }
	end

end