class SendAlert < Interactor

	def self.for(entry:)
		send_alert = new(entry: entry)
		send_alert.execute
	end

	def initialize(entry:)
		@entry = entry
	end

	def execute
		send_alert
	end

	private

	def send_alert
		claim_subscriber_tickets
		puts "Sending email for ====> #{@entry.title} \n"
		send_entry_email
		@entry.update_attributes(:released_at => DateTime.now, :email_sent => true)
	end

	def send_entry_email
		SendEmailToSubscribers.for(entry: @entry)
	end


end
