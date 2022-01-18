class EntryIsSubscriberWish < Interactor
	include ApplicationHelper

	def self.for(entry:, subscriber:)
		new(entry: entry, subscriber: subscriber).execute
	end

	def initialize(entry:, subscriber:)
		@entry = entry
		@subscriber = subscriber
		@response = nil
	end

	def execute
		@subscriber.wishes.each do |wish|
			if strip_chars(@entry.title).include? strip_chars(wish.name)
				@response = wish
				break
			end
		end

		@response
	end

end