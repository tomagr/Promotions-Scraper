class SendClaimedEmail < BaseInteractor
	validates :entry, presence: true

	def self.for(entry:)
		new(entry: entry).execute
	end

	def initialize(entry:)
		@entry = entry
	end

	def execute
		send_claimed_eemail @entry
	end

	private

	def send_claimed_eemail entry
		console_log "CLAIMED Email sent for ====> #{entry.title}"
		UserMailer.claimed_email(entry: entry).deliver_now
	end


end