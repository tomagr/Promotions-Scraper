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
		parse_response response
	end

	def parse_response response
		html_text = Nokogiri::HTML(response.body)
		message = html_text.css('.blog-item-small-content')
		text = Rails::Html::FullSanitizer.new.sanitize(message.to_s)
		text.gsub(/\s+/, " ")
	end

	def endpoint
		"experiencia/canjear/" + @entry_external_id.to_s
	end

	def uri endpoint
		URI.parse(tickets_url + endpoint)
	end

	def cookies
		# 19865
		# 'controlGroupV3={"GrupoControlMeteredV3":"-1","expire":1643124345.195,"inicio":1642519545,"quota":12}; metering_arc_ab_testing={"inicio":"2020-09-23","group":"A"}; _hjSessionUser_547571=eyJpZCI6ImU2NjVkNzdlLTI0NDAtNWQxMy1iYzVkLWU0MTgyNTczNWQzOCIsImNyZWF0ZWQiOjE2NDI1NjQ0MDY2MzMsImV4aXN0aW5nIjp0cnVlfQ==; ln-notification=false; metering_arc_counter=5; PHPSESSID=4qnvm05suvgg3pt3nisipr81k4; AMP_TOKEN=%24NOT_FOUND; _gid=GA1.3.1678917713.1642705388; propension=0; fbm_169655146422657=base_domain=.lanacion.com.ar; _hjFirstSeen=1; _hjSession_608431=eyJpZCI6IjU2ZTI0ODEwLWZiNTUtNGYwNi05ZWU1LTQyZGQ0YmRiZDMxYSIsImNyZWF0ZWQiOjE2NDI3MDY4MjY5MzAsImluU2FtcGxlIjp0cnVlfQ==; _hjAbsoluteSessionInProgress=1; _hjSessionUser_608431=eyJpZCI6IjEyMTQwMjJjLTFjNzAtNTVhNi1hZGYyLWVmYzQ4ZjM5MWI0OSIsImNyZWF0ZWQiOjE2NDI3MDY4MjY4OTQsImV4aXN0aW5nIjp0cnVlfQ==; _dc_gtm_UA-621326-98=1; _hjSession_547571=eyJpZCI6ImFjY2M5OTgxLTQwM2QtNDkwYS05ZjFkLWNmOGM2MTNjNTExMiIsImNyZWF0ZWQiOjE2NDI3MDY5MDI0NTgsImluU2FtcGxlIjpmYWxzZX0=; _parsely_session={%22sid%22:2%2C%22surl%22:%22https://www.lanacion.com.ar/%22%2C%22sref%22:%22%22%2C%22sts%22:1642706902545%2C%22slts%22:1642595054178}; _parsely_visitor={%22id%22:%22pid=4973f639f2e040f489c2116cd8377dcd%22%2C%22session_count%22:2%2C%22last_session_ts%22:1642706902545}; fbsr_169655146422657=wK2uDbnzFXYyOvb2tRYj5JHOwQpiUfJrBMfyEpqe4zg.eyJ1c2VyX2lkIjoiMTAyMTA5OTk3MjE0MDM1MTgiLCJjb2RlIjoiQVFCVlZxdVAzaTVYWVNyekUxamstb0xNcDYwNllSdEJTQkhpMHQ2ekhhb1RWNlk3eERacllLVjZhdmZ3bEVzMndFRFdXS216RWFOUmdnM2Z5akxsUWdpVHVUeTNwZDlFeTF2QklsVTJSVFNBalhNSEFDU2Q1S3NRbDJZaWE5eWdFTWZ1VTd2WUhvSjVUY05LM0lLTVNMTFRsaXhTN2FSYnNJbU5FRHF3Tl91UFBhOVRPdHZBWHRzREJ6WXRGMW5HdFFzNndEczZRNThUMUtUNHVYZEtGaFV4TWdmVm40dXd1anlTbTI3dWdSZm5SLURtVFFaLXZNNFBFWGk2VDJGcEZiajAwaWt3RlBBNFM0bzF2NHBjNXVvY2NqRTEwWXhoc3VMRGtqX3o4b3dVWnpxTHRLNm5kZVpwd09SNnl3Sk1vMWZtWldtMmZBbEo3OF82VmlzLWJ0Tm9kaHlXejhHaXoxbnlyc3pMb3gzRmdBIiwiYWxnb3JpdGhtIjoiSE1BQy1TSEEyNTYiLCJpc3N1ZWRfYXQiOjE2NDI3MDY5MjF9; token=5E902B8D-5CA3-4B3A-8636-06B3413C0ACE; xvalue=fdd66d3a-a681-4bed-a75b-0f4a9272b5c0; LNPreferencias=0usuario%5Fid=3104118; cookieLogin=usuario%5Fid=3104118&estado_id=1&nacimiento=&usuario_facebook_id=10210999721403518&usuario_gmail_id117360688670536991880; syncLfLN=30/04/2022 04:28:42 p.m.; tieneClub=0; usuarioDetalleClubNacion=B; usuarioemail=smacagno@gmail.com; usuario%5Flogtkn=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHBpcmVzIjoxNjUxMzQ2OTIyLCJ1c2VyX2lkIjoiMzEwNDExOCIsImRpc3BsYXlfbmFtZSI6InNtYWNhZ25vIiwiZG9tYWluIjoibGEtbmFjaW9uLmZ5cmUuY28ifQ.R--09VVyWr8BYl9TWISM59zRrQIgiQjwe0ew1s4JRXA; ProductoPremiumId=2,3,4,5; PersoTKN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiRUQ2MDkwOTk2MEIwNDhFREI2MzY4NDM0MDdDRjgyRkEiLCJpZF92ZXJpZmllciI6IjVFOTAyQjhEIiwiZXhwIjoxOTU4MDY2OTIyLCJpc3MiOiJsYW5hY2lvbi5jb20uYXIiLCJhdWQiOiJsbmRpZ2l0YWwifQ.JcUwRrNVDNmY-a6xwlnW1Y3BXxOVwEiys8TDSC3NuNA; usuario%5Fid=3104118; usuario%5Fdetalle%5Fnick=smacagno; usuario%5Fdetalle%5Fguid={5E902B8D-5CA3-4B3A-8636-06B3413C0ACE}; usuario%5Fusuario=smacagno; Crm_id=A00624459; metering_arc=entitlement=SUBSCRIBED.expiration=1651346922.YVNLN0AoznArZ+Cd9OspqMgY5Qv2qmywEZ7fdrIcp7c=; gaComboType=ga-combo3; shouldrelogin=true; nvg18894=101308b346926de261057b9d8210|0_21; _dc_gtm_UA-621326-120=1; _ga_EXRLGM6KVR=GS1.1.1642705387.5.1.1642706931.15; _ga_F5K6E3M5PT=GS1.1.1642705387.5.1.1642706931.15; _ga=GA1.3.1713545812.1642519545; AWSALB=KY1Oo+g8QMWsaL5GVzsXJCsiGGag89OkDl4iPw+PBCDlTKaziS76+aNrn7rOiYG6cgj34zsmlU3WomaUobEZvKPu4WhDTra+QG4KuO1040P8HdnFiU9EeNmSxxCE; AWSALBCORS=KY1Oo+g8QMWsaL5GVzsXJCsiGGag89OkDl4iPw+PBCDlTKaziS76+aNrn7rOiYG6cgj34zsmlU3WomaUobEZvKPu4WhDTra+QG4KuO1040P8HdnFiU9EeNmSxxCE'
		"PHPSESSID=#{phpsessid}; cookieLogin=#{cookie_login}; usuario%5Flogtkn=#{flog_token}; usuario%5Fid=#{user_id}; usuario%5Fdetalle%5Fguid=#{usuario_detalle_guid}; usuario%5Fusuario=#{username};"
	end

	def phpsessid
		# This ID needs to be updated - Fequency? Dunno
		'4qnvm05suvgg3pt3nisipr81k4'
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