class EntryIsFilteredBySubscriber < Interactor

	def self.for(entry:, subscriber:)
		send_alert = new(entry: entry, subscriber: subscriber)
		send_alert.execute
	end

	def initialize(entry:, subscriber:)
		@entry = entry
		@subscriber = subscriber
	end

	def execute
		@subscriber.filters.map(&:name).any?{ |f| title.downcase.include? f.downcase }
	end

end
