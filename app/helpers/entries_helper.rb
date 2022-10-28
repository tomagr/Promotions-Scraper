module EntriesHelper

	def parse_id_from_uri uri
		uri.gsub("/experiencia/", "").to_i
	end

	def is_today? entry
		!(entry.status =~ /HOY/i).nil?
	end

	def entry_is_available_to_claim entry
		# figcaption element contains the 'Reservá ahora' text
		entry.css('figcaption').present? #and entry.css('figcaption').text == 'Reservá ahora'
	end

end
