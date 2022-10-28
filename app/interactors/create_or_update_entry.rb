class CreateOrUpdateEntry < BaseInteractor
	include EntriesHelper

	def self.by(title:, status:, site_id:)
		new(title: title, status: status, site_id: site_id).execute
	end

	def initialize(title:, status:, site_id:)
		@title = title
		@status = status
		@site_id = site_id
	end

	def execute
		create_or_update @title, @status, @site_id
	end

	private

	def create_or_update title, status, site_id
		Entry.find_by_site_id(site_id).nil? ? create_entry(title, status, site_id) : update_entry(status, site_id)
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

	def has_not_been_notified entry
		entry.has_not_sent_email and is_an_available_entry? entry
	end

	def is_an_available_entry? entry
		@last_id == entry.site_id or is_today?(entry)
	end

	def send_alert_if_available entry
		SendAlert.for(entry: entry) if is_today?(entry) and entry_is_available_to_claim(entry)
	end

end
