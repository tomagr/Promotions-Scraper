class SaveEntry < BaseInteractor

	def self.by(xml_entry:, last_id:)
		new(xml_entry: xml_entry, last_id: last_id).execute
	end

	def initialize(xml_entry:, last_id:)
		@xml_entry = xml_entry
		@last_id = last_id
	end

	def execute
		invalid_xml_entry @xml_entry
		save_entry @xml_entry
	end

	private

	def save_entry xml_entry
		@parsed_entry = xml_entry
		title = @parsed_entry.css('h2 a').text

		if title.present?
			site_id = parse_id_from_uri @parsed_entry.css('h2 a')[0]['href']
			status = @parsed_entry['data-condition']

			console_log "Scrapping #{title} - Status: #{status}"
			create_or_update title, status, site_id
			claim_subscriber_tickets @saved_entry if entry_is_available_to_claim

			site_id
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
		console_log "creating_entry #{title} - Status: #{status} - Site ID: #{site_id}"
		@saved_entry = Entry.create(:title => title, :status => status, :site_id => site_id)
		send_alert_if_available @saved_entry
	end

	def update_entry status, site_id
		console_log "updating_entry Status: #{status} - Site ID: #{site_id}"
		@saved_entry = Entry.find_by_site_id site_id
		# Check if status changed,
		# or if the emails has not been sent and the id is
		# the same as last one (more than one in the page)

		if has_not_been_notified @saved_entry
			@saved_entry.update_attributes(:status => status)
			send_alert_if_available @saved_entry
		end
	end

	def claim_subscriber_tickets entry
		ClaimWishTickets.for(entry: entry)
	end

	def has_not_been_notified entry
		entry.has_not_sent_email and is_an_available_entry? entry
	end

	def is_an_available_entry? entry
		@last_id == entry.site_id or is_today?(entry)
	end

	def send_alert_if_available entry
		SendAlert.for(entry: entry) if is_today?(entry) and entry_is_available_to_claim
	end

	def parse_id_from_uri uri
		uri.gsub("/experiencia/", "").to_i
	end

	def is_today? entry
		!(entry.status =~ /HOY/i).nil?
	end

	def entry_is_available_to_claim
		# figcaption element contains the 'Reservá ahora' text
		@parsed_entry.css('figcaption').present? #and entry.css('figcaption').text == 'Reservá ahora'
	end

end
