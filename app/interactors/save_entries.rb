class SaveEntries < Interactor

	def self.save(entries:)
		save_entries = new(entries: entries)
		save_entries.execute
	end

	def initialize(entries:)
		@entries = entries
	end

	def execute
		analize_and_save
	end

	private

	def analize_and_save
		@entries.each do |entry|
			save_entry entry
		end
	end

	def save_entry entry
		@parsed_entry = entry
		title = @parsed_entry.css('h2 a').text

		if title.present?
			site_id = parse_id_from_uri @parsed_entry.css('h2 a')[0]['href']
			status = @parsed_entry['data-condition']

			create_or_update title, status, site_id
		end
	end

	def create_or_update title, status, site_id
		if Entry.find_by_site_id(site_id).nil?
			create_entry title, status, site_id
		else
			update_entry status, site_id
		end
	end

	def create_entry title, status, site_id
		entry = Entry.create(:title => title, :status => status, :site_id => site_id)
		send_alert_if_available entry
	end

	def update_entry status, site_id
		entry = Entry.find_by_site_id site_id
		if entry.status != status
			entry.update_attributes(:status => status)
			send_alert_if_available entry
		end
	end

	def send_alert_if_available entry
		SendAlert.for(entry: entry) if is_today?(entry) and entry_is_available?
	end

	def parse_id_from_uri uri
		uri.gsub("/experiencia/", "").to_i
	end

	def is_today? entry
		entry.status == 'today'
	end

	def entry_is_available?
		# figcaption element contains the 'Reservá ahora' text
		@parsed_entry.css('figcaption').present? #and entry.css('figcaption').text == 'Reservá ahora'
	end


end
