class CreateOrUpdateEntry < BaseInteractor
	include EntriesHelper

	def self.by(title:, status:, site_id:, available:)
		new(title: title, status: status, site_id: site_id, available: available).execute
	end

	def initialize(title:, status:, site_id:, available:)
		@title = title
		@status = status
		@site_id = site_id
		@available = available
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
		Entry.find_by_site_id(site_id).nil? ? create_entry(title, status, site_id, available) : update_entry(status, site_id, available)
	end

	def create_entry title, status, site_id, available
		console_log "creating_entry #{title} - Status: #{status} - Site ID: #{site_id} - Available: #{available}"
		@entry = Entry.create(:title => title, :status => status, :site_id => site_id, :available => available)
		send_alert_if_available @entry
	end

	def update_entry status, site_id, available
		console_log "updating_entry Status: #{status} - Site ID: #{site_id} - Available: #{available}"
		@entry = Entry.find_by_site_id site_id
		@entry.update!(:status => status, :available => available) if @entry.status != status or @entry.available != available

		send_alert_if_available @entry
	end

	def send_alert_if_available entry
		SendAlert.for(entry: entry) if is_available(entry)
	end

end
