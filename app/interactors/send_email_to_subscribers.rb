class SendEmailToSubcribers < Interactor

	def self.for(entry:)
		send_alert = new(entry: entry)
		send_alert.execute
	end

	def initialize(entry:)
		@entry = entry
	end

	def execute
		UserMailer.new_entry_email(@entry).deliver_now
	end

end