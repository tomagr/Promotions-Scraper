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
		log_entry_message
		send_entry_email
		@entry.update_attributes(:released_at => DateTime.now, :email_sent => true)
	end

	def log_entry_message
		puts "Email sent for ====> #{@entry.title} \n"
	end

	def write_to_console message
		Rails.logger = Logger.new(STDOUT)
		puts message
	end

	def send_entry_email
		SendEmailToSubcribers.for(entry: @entry)
	end

end
