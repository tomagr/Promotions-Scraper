class EntryIsSubscriberWish < Interactor
	include ApplicationHelper

	def self.for(entry:)
		new(entry: entry).execute
	end

	def initialize(entry:)
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