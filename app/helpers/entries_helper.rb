module EntriesHelper

	def parse_id_from_uri uri
		uri.gsub("/experiencia/", "").to_i
	end

	def is_today? entry
		!(entry.status =~ /HOY/i).nil?
	end

end
