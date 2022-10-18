class SendAlert < BaseInteractor

	def self.for(entry:)
		new(entry: entry).execute
	end

	def initialize(entry:)
		@entry = entry
	end

	def execute
		send_alert
	end

	private

	def send_alert
		begin
			claim_subscriber_tickets
		rescue Exception => e
			console_log "claim_subscriber_tickets Exception: #{e}"
		end

		puts "Sending email for ====> #{@entry.title} \n"
		send_entry_email
		@entry.update_attributes(:released_at => DateTime.now, :email_sent => true)
	end

	def send_entry_email
		SendEmailToSubscribers.for(entry: @entry)
	end

end
