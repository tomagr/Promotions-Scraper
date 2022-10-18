class SendEmailToSubscribers < BaseInteractor
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
			filter_entry = EntryIsFilteredBySubscriber.for(entry: @entry, subscriber: subscriber)
			send_entry_email(subscriber) unless filter_entry
		end
	end

	private

	def send_entry_email subscriber
		console_log "Email sent for ====> #{@entry.title}"
		UserMailer.new_entry_email(entry: @entry, subscriber: subscriber).deliver_now
	end


end