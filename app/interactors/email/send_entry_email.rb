class SendEntryEmail < BaseInteractor
	validates :entry, presence: true

	def self.for(entry:)
		new(entry: entry).execute
	end

	def initialize(entry:)
		@entry = entry
	end

	def execute
		send_email @entry
	end

end