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
		invalid_title @title
		invalid_status @status
		invalid_site_id @site_id

		create_or_update @title, @status, @site_id
		@entry
	end

	private

	def create_or_update title, status, site_id
		Entry.find_by_site_id(site_id).nil? ? create_entry(title, status, site_id) : update_entry(status, site_id)
	end

	def create_entry title, status, site_id
		console_log "creating_entry #{title} - Status: #{status} - Site ID: #{site_id}"
		@entry = Entry.create(:title => title, :status => status, :site_id => site_id)
		send_alert_if_available @entry
	end

	def update_entry status, site_id
		console_log "updating_entry Status: #{status} - Site ID: #{site_id}"
		@entry = Entry.find_by_site_id site_id
		@entry.update!(:status => status) if @entry.status != status

		send_alert_if_available @entry
	end

	def send_alert_if_available entry
		SendAlert.for(entry: entry) if is_available(entry)
	end

end
