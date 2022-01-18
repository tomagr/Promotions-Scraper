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
			wish = EntryIsSubscriberWish.for(entry: @entry, subscriber: subscriber)
			claim_tickets wish if wish.present?
			
			filter_entry = EntryIsFilteredBySubscriber.for(entry: @entry, subscriber: subscriber)
			send_entry_email(subscriber) unless filter_entry
		end
	end

	private

	def claim_tickets wish
		5.times do
			response = ClaimTickets.for(entry_external_id: @entry.site_id)
			if response.present?
				wish.update_attributes!(:response => response)
				break
			end
		end

	end

	def send_entry_email subscriber
		log_entry_message
		UserMailer.new_entry_email(entry: @entry, subscriber: subscriber).deliver_now
	end

	def log_entry_message
		puts "Email sent for ====> #{@entry.title} \n"
	end

end