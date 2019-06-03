class EntryIsFilteredBySubscriber < Interactor
	include ApplicationHelper

	def self.for(entry:, subscriber:)
		send_alert = new(entry: entry, subscriber: subscriber)
		send_alert.execute
	end

	def initialize(entry:, subscriber:)
		@entry = entry
		@subscriber = subscriber
	end

	def execute
		@subscriber.filters.map(&:name).any? { |tag| strip_chars(@entry.title).include? strip_chars(tag) }
	end

end
