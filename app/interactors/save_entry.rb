class SaveEntry < BaseInteractor
	include EntriesHelper

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

			CreateOrUpdateEntry.by(title: title, status: status, site_id: site_id)
			claim_subscriber_tickets @saved_entry if entry_is_available_to_claim(@parsed_entry)

			site_id
		end
	end

	def claim_subscriber_tickets entry
		ClaimWishTickets.for(entry: entry)
	end

end
