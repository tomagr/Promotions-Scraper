class SendEmailToSubscribers < Interactor
	validates :entry, presence: true

	def self.for(entry:)
		send_alert = new(entry: entry)
		send_alert.execute
	end

	def initialize(entry:)
		@entry = entry
	end

	def execute
		Subscriber.available.each do |subscriber|
			UserMailer.new_entry_email(entry: @entry, subscriber: subscriber).deliver_now
		end
	end

end