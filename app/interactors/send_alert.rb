class SendAlert < Interactor

	def self.for(entry:)
		send_alert = new(entry: entry)
		send_alert.execute
	end

	def initialize(entry:)
		@entry = entry
	end

	def execute
		send_alert_if_available
	end

	private

	def send_alert_if_available
		write_to_console
		UserMailer.new_entry_email(@entry).deliver_now
	end

	def write_to_console
		Rails.logger = Logger.new(STDOUT)
		puts "Email sent for ====> #{@entry.title} \n"
	end

end
