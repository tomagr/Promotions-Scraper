module EntriesHelper

	def parse_id_from_uri uri
		uri.gsub("/experiencia/", "").to_i
	end

	def is_today? entry
		!(entry.status =~ /HOY/i).nil?
	end

	def xml_entry_is_available xml_entry
		# figcaption element contains the 'Reservá ahora' text
		xml_entry.css('figcaption').present? #and entry.css('figcaption').text == 'Reservá ahora'
	end

	def is_available entry
		# Check if status changed,
		# or if the emails has not been sent and the id is
		# the same as last one (more than one in the page)
		is_today?(entry) and entry.has_not_sent_email and entry.available
	end


end
